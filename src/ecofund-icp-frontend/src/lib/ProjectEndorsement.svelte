<script>
  import { Button, NumberInput, Column } from "carbon-components-svelte";
  import { Add } from "carbon-icons-svelte";
  import { auth } from "$lib/store/auth";
  import { LedgerCanister, AccountIdentifier } from "@dfinity/ledger-icp";
  import { createAgent } from "@dfinity/utils";
  import { Principal } from "@dfinity/principal";
  import { createEventDispatcher } from "svelte";

  let investmentAmount = 0;
  export let destinationAddress;

  console.log(destinationAddress);
  console.log(Principal.fromText(destinationAddress));

  const setupLedger = async (identity) => {
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
      canisterId: ledgerCanisterId,
    });
  };

  const dispatch = createEventDispatcher();

  const handleEndorse = async () => {
    if (!$auth.loggedIn) {
      console.log("User not authenticated with Internet Identity");
      dispatch("notify", {
        kind: "error",
        title: "Authentication Error",
        subtitle: "Please log in with Internet Identity.",
      });
      return;
    }

    if (!investmentAmount || investmentAmount <= 0) {
      console.log("Invalid investment amount");
      dispatch("notify", {
        kind: "error",
        title: "Invalid Amount",
        subtitle: "Please enter a valid investment amount.",
      });
      return;
    }

    try {
      const result = (await setupLedger($auth.identity)).transfer({
        to: AccountIdentifier.fromPrincipal({
          principal: Principal.fromText(destinationAddress),
        }),
        amount: investmentAmount * 100000000,
        fee: BigInt(10000),
      });

      console.log("Transfer successful:", await result);
      dispatch("notify", {
        kind: "success",
        title: "Transfer Successful",
        subtitle: `You endorsed ${investmentAmount} ICP.`,
      });
    } catch (error) {
      console.log("Transfer failed:", error);
      dispatch("notify", {
        kind: "error",
        title: `Transfer Failed ${error.message}`,
        subtitle:
          error instanceof Error ? error.message : "Unknown error occurred.",
      });
    }
  };

  // onMount(async () => {
  //   if ($auth.loggedIn) {
  //     accountBalance = await getAccountBalance();
  //   }
  // });
</script>

<!-- <Column id="ICP_Selection" lg={2}> -->
<div class="investment-box">
  <div class="investment-fund">
    <p>Endorse this Project</p>
    <!-- <p style="z-index: 99;">You have {accountBalance || 0} ICP</p> -->
    <NumberInput
      hideSteppers
      label="ICP"
      bind:value={investmentAmount}
      min={0}
      step={0.1}
    />
    <Button
      icon={Add}
      class=" width: 60%; position: relative; left: 20%; top: 1%; background-color: #59cf8c;"
      on:click={handleEndorse}
    >
      Endorse this project
    </Button>
  </div>
</div>

<!-- </Column> -->

<style>
  .investment-box {
    position: relative;
    left: 20%;
    top: 15%;
  }

  .investment-fund {
    border: 1px solid black;
    box-shadow: -1px -3px 5px 6px rgba(173, 173, 173, 0.99) inset;
    display: flex;
    flex-direction: column;
    border-radius: 5%;
    padding: 15px;
    width: 35vw;
    height: 30vh;
  }

  .investment-fund p {
    margin-bottom: 5%;
    font-size: 18px;
    font-weight: bold;
  }
</style>
