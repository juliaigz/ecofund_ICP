<script>
  import { Button, NumberInput, Column } from "carbon-components-svelte";
  import { Add } from "carbon-icons-svelte";
  import { auth } from "$lib/store/auth";
  import {
    LedgerCanister,
    principalToAccountIdentifier,
  } from "@dfinity/ledger-icp";
  import { createAgent } from "@dfinity/utils";
  import { Principal } from "@dfinity/principal";
  import { HttpAgent } from "@dfinity/agent";
  import { AuthClient } from "@dfinity/auth-client";

  let investmentAmount = 0;
  let destinationAddress = Principal.fromText(
    "j36b6-fw3lq-t67q6-h55q2-3l7tu-bu5ad-aszjw-yy4m4-pdoqj-txm4o-kqe"
  );

  let accountBalance = null;

  const setupLedger = async (identity) => {
    const agent = await createAgent({
      identity,
      host:
        process.env.DFX_NETWORK === "ic"
          ? "https://ic0.app"
          : "http://localhost:4943",
    });

    const ledgerCanisterId =
      process.env.DFX_NETWORK === "ic"
        ? "ryjl3-tyaaa-aaaaa-aaaba-cai" // Mainnet ICP Ledger canister ID
        : "ryjl3-tyaaa-aaaaa-aaaba-cai"; // Local ICP Ledger canister ID

    return LedgerCanister.create({
      agent,
      canisterId: ledgerCanisterId,
    });
  };

  const sendICP = async (ledger, toPrincipal, amount) => {
    try {
      const E8S_PER_ICP = BigInt(100000000);
      const toAccountIdentifier = principalToAccountIdentifier(
        toPrincipal,
        null
      );
      const result = await ledger.transfer({
        to: toAccountIdentifier,
        amount: { e8s: amount },
        fee: { e8s: BigInt(10000) },
        memo: BigInt(0),
        from_subaccount: [],
        created_at_time: [],
      });
      return result;
    } catch (error) {
      console.error("Error sending ICP:", error);
      throw error;
    }
  };

  const getAccountBalance = async () => {
    if (!$auth.loggedIn) {
      console.log("User not authenticated with Internet Identity");
      return;
    }

    try {
      const ledger = await setupLedger($auth.identity);
      const accountIdentifier = principalToAccountIdentifier(
        $auth.principal,
        null
      );
      const balance = await ledger.accountBalance({
        accountIdentifier,
      });
      accountBalance = Number(balance.e8s) / 100000000; // Convert e8s to ICP
      console.log("Account balance:", accountBalance, "ICP");
    } catch (error) {
      console.error("Error fetching account balance:", error);
      // Handle error (e.g., show error message to user)
    }
  };

  const handleEndorse = async () => {
    if (!$auth.loggedIn) {
      console.log("User not authenticated with Internet Identity");
      return;
    }

    await getAccountBalance();

    if (!investmentAmount || investmentAmount <= 0) {
      console.log("Invalid investment amount");
      return;
    }

    console.log("Endorsing project with ICP:", investmentAmount);
    try {
      const ledger = await setupLedger($auth.identity);
      console.log(ledger);
      const amountInE8s = BigInt(Math.floor(investmentAmount * 100000000)); // Convert ICP to e8s

      console.log(amountInE8s);
      console.log(investmentAmount);
      const result = await sendICP(ledger, destinationAddress, amountInE8s);
      console.log("Transfer successful:", result);
      // Handle successful transfer (e.g., show success message to user)
    } catch (error) {
      console.error("Transfer failed:", error);
      // Handle transfer failure (e.g., show error message to user)
    }
  };
</script>

<Column id="ICP_Selection" lg={2}>
  <div class="investment-box">
    <div class="investment-fund">
      <p>Endorse this Project</p>
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
</Column>

<style>
  .investment-box {
    position: relative;
    left: 20%;
    top: 30%;
  }

  .investment-fund {
    border: 1px solid black;
    box-shadow: -1px -3px 5px 6px rgba(173, 173, 173, 0.99) inset;
    display: flex;
    flex-direction: column;
    border-radius: 5%;
    padding: 10%;
    width: 35vw;
    height: 30vh;
  }

  .investment-fund p {
    margin-bottom: 5%;
    font-size: 18px;
    font-weight: bold;
  }
</style>
