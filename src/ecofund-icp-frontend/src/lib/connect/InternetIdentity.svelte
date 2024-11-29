<script lang="ts">
  import { AuthClient } from "@dfinity/auth-client";
  import { onMount } from "svelte";
  import { Principal } from "@dfinity/principal";
  import { auth, createActor } from "../store/auth";
  import { Button } from "carbon-components-svelte";
  import InternetComputer from "$lib/images/internet-computer-icp-seeklogo.svg";
  import { Logout } from "carbon-icons-svelte";
  import { ToastNotification } from "carbon-components-svelte";
  import { LedgerCanister, AccountIdentifier } from "@dfinity/ledger-icp";
  import { createAgent } from "@dfinity/utils";
  import type { Identity } from "@dfinity/agent";

  let client: AuthClient | undefined;
  let whoami: Promise<Principal> = $auth.actor.whoami(); // whoami es una promesa que resuelve en una string (principal)
  let balance: bigint = 0n;
  let accountId;

  const setupLedger = async (identity: Identity) => {
    const agent = await createAgent({
      identity,
      host:
        process.env.DFX_NETWORK === "ic"
          ? "https://ic0.app"
          : "http://localhost:4943", //change before test deploy frontend
      verifyQuerySignatures: process.env.DFX_NETWORK === "ic" ? true : false,
    });

    if (process.env.DFX_NETWORK !== "ic") {
      await agent.fetchRootKey();
    }

    const ledgerCanisterId =
      process.env.DFX_NETWORK === "ic"
        ? "ryjl3-tyaaa-aaaaa-aaaba-cai" // Mainnet ICP Ledger canister ID
        : process.env.CANISTER_ID_ICP_LEDGER_CANISTER; // Local ICP Ledger canister ID

    return LedgerCanister.create({
      agent,
      canisterId: Principal.fromText(ledgerCanisterId),
    });
  };

  const getAccountBalance = async () => {
    if (!$auth.loggedIn) {
      console.log("User not authenticated with Internet Identity");
      return;
    }

    try {
      const balance = (await setupLedger($auth.identity)).accountBalance({
        accountIdentifier: AccountIdentifier.fromPrincipal({
          principal: $auth.principal,
        }),
        // certified: null,
      });
      // accountBalance = Number(balance) / 100000000; // Convert e8s to ICP
      console.log("Account balance:", await balance, "ICP");
      return await balance;
    } catch (error) {
      console.error("Error fetching account balance:", error);
      // Handle error (e.g., show error message to user)
    }
  };

  onMount(async () => {
    client = await AuthClient.create();
    if (await client.isAuthenticated()) {
      handleAuth();
    }

    if ($auth.loggedIn) {
      balance = await getAccountBalance();
      accountId = AccountIdentifier.fromPrincipal({
        principal: $auth.principal,
      }).toHex();
    }
  });

  function handleAuth() {
    if (!client) return; // Verificamos que client no sea undefined
    auth.update(() => ({
      loggedIn: true,
      actor: createActor({
        agentOptions: {
          identity: client!.getIdentity(),
        },
      }),
      identity: client?.getIdentity(),
      principal: client?.getIdentity().getPrincipal(),
    }));

    accountId = AccountIdentifier.fromPrincipal({
      principal: $auth.principal,
    }).toHex();

    whoami = $auth.actor.whoami();
  }

  function login() {
    if (!client) return; // Verificamos que client no sea undefined
    client.login({
      identityProvider:
        process.env.DFX_NETWORK === "ic"
          ? "https://identity.ic0.app/#authorize"
          : `http://${process.env.CANISTER_ID_INTERNET_IDENTITY}.localhost:4943/#authorize`,
      onSuccess: handleAuth,
    });
  }

  async function logout() {
    if (!client) return; // Verificamos que client no sea undefined
    await client.logout();
    auth.update(() => ({
      loggedIn: false,
      actor: createActor(),
      principal: null,
      identity: null,
    }));

    whoami = $auth.actor.whoami();
  }
</script>

<div class="container">
  {#if $auth.loggedIn}
    <!-- Si el usuario está logueado pasa a este diseño -->
    <div class="logout-wallet">
      <div class="boxButton">
        <Button
          class="iconLogout"
          on:click={logout}
          icon={Logout}
          iconDescription="Logout"
          style="  background-color: #59cf8c; border-radius: 7px;"
        ></Button>
      </div>
      <div class="information-box">
        <!-- <p class="amount-of-money">$0.00</p> -->
        <p class="amount-crypto">{`${balance} ICP`}</p>
        <div class="infoCopy">
          <p>
            Copy Account ID for sending from exchanges and Principal ID for ICP
            network.
          </p>
        </div>
        <div class="infoWarning">
          <ToastNotification lowContrast kind="warning" hideCloseButton>
            <strong slot="caption">
              Internet Identity generates unique Principal IDs and Account IDs
              for each Dapp. This feature ensures that user identities and
              account information are isolated across different applications,
              enhancing security and privacy protection.
            </strong>
          </ToastNotification>
        </div>
      </div>
    </div>
    <div class="principal-info">
      <!-- principal information: -->
      {#await whoami}
        Querying caller identity...
      {:then principal}
        <!-- <code>Principal: {principal}</code> -->
        <!-- <br />
        <br /> -->
        <code>Account: {accountId}</code>
        <!-- principal del usuario para que pueda recibir sus icp-->
        <!-- {#if principal.isAnonymous()}
          (anonymous)
        {/if} -->
      {/await}
    </div>
  {:else}
    <!-- SI el usuario NO está logueado pasa a este diseño-->
    <div class="PrincipalButtonIdentity">
      <Button
        class="buttonIdentity"
        style="width: 42rem; height: 8rem;"
        on:click={login}
      >
        Internet Identity
        <img
          class="internetComputer"
          src={InternetComputer}
          alt="Internet Computer Logo"
        />
      </Button>
    </div>
  {/if}
</div>

<style>
  .container {
    margin: 64px 0;
  }

  .logout-wallet {
    width: 100%;
  }

  .principal-info {
    margin-top: 32px;
    text-align: center;
    font-weight: bold;
    color: rgb(27, 27, 27);
  }

  .information-box {
    /* border: 1px solid green; */
    width: 100%;
    display: flex;
    justify-content: center;
    flex-direction: column;
    align-items: center;
  }

  /* .information-box .amount-of-money {
    text-align: center;
    font-weight: bold;
    font-size: 2em;
  } */

  .information-box .amount-crypto {
    text-align: center;
    font-weight: bold;
    font-size: 1.2rem;
  }

  .infoCopy {
    margin-top: 1rem;
  }

  .infoWarning {
    margin-top: 1rem;
  }

  .PrincipalButtonIdentity {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  :global(.buttonIdentity) {
    background-color: #59cf8c;
    width: 12rem;
    border-radius: 7px;
    padding: 5%;
    display: flex;
    justify-content: center;
  }

  :global(.buttonIdentity):hover {
    background-color: white;
    border-color: #59cf8c;
    color: black;
  }

  :global(.iconLogout):hover {
    background-color: white;
    border-color: #59cf8c;
    color: black;
  }

  .internetComputer {
    width: 6em;
  }
</style>
