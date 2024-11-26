<script lang="ts">
  import { AuthClient } from "@dfinity/auth-client";
  import { onMount } from "svelte";
  import { Principal } from "@dfinity/principal";
  import { auth, createActor } from "../store/auth";
  import { Button } from "carbon-components-svelte";
  import InternetComputer from "$lib/images/internet-computer-icp-seeklogo.svg";
  import { Logout } from "carbon-icons-svelte";

  let client: AuthClient | undefined;
  let whoami: Promise<Principal> = $auth.actor.whoami(); // whoami es una promesa que resuelve en una string (principal)

  onMount(async () => {
    client = await AuthClient.create();
    if (await client.isAuthenticated()) {
      handleAuth();
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
    }));

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
    }));

    whoami = $auth.actor.whoami();
  }
</script>

<div class="container">
  {#if $auth.loggedIn}
    <!-- Si el usuario está logueado pasa a este diseño -->
    <div class="logout-wallet">
      <Button class="iconLogout" on:click={logout} icon={Logout} iconDescription="Logout"></Button>
      <p>
        asd
      </p>
    </div>
    <div class="principal-info">
      <!-- principal information: -->
      {#await whoami}
        Querying caller identity...
      {:then principal}
        <code>{principal}</code>
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

  .logout-wallet{
    width: 100%;
    border: 1px solid black;
  }







  .principal-info {
    margin-top: 32px;
    text-align: center;
    font-weight: bold;
    color: rgb(27, 27, 27);
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

  .internetComputer {
    width: 6em;
  }
</style>
