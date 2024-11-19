<script>
  import { Button, NumberInput, Column } from "carbon-components-svelte";
  import { Add } from "carbon-icons-svelte";
  import { auth } from "$lib/store/auth";

  let investmentAmount = 0;

  const handleEndorse = () => {
    if (!$auth.loggedIn) {
      console.log("no II");
      return;
    }

    if (!investmentAmount || investmentAmount <= 0) {
      console.log("Invalid investment amount");
      return;
    }

    console.log("Endorsing project with ICP:", investmentAmount);
    // Aquí puedes agregar la lógica para manejar el respaldo del proyecto.
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
