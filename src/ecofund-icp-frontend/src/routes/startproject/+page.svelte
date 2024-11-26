<script>
  //svelte components
  import { ProgressIndicator, ProgressStep } from "carbon-components-svelte";
  import { Grid, Row, Column } from "carbon-components-svelte";
  import { TextInput } from "carbon-components-svelte";
  import { MultiSelect } from "carbon-components-svelte";
  import { TextArea } from "carbon-components-svelte";
  import { FileUploader } from "carbon-components-svelte";
  import { Button } from "carbon-components-svelte";
  import { goto } from "$app/navigation";

  import Yourproject from "$lib/yourproject.svelte";
  import Submitproyect from "$lib/submitproyect.svelte";

  //Codigo para cambiar las secciones de forms
  let formSteps = 1;
  const maxSteps = 2;

  function increaseFormSteps() {
    formSteps += 1;
    if (formSteps > maxSteps) {
      formSteps = 1;
    }
  }

  function decreaseFormSteps() {
    formSteps -= 1;
    if (formSteps < 1) {
      formSteps = 1;
    }
  }

  function callToBackend() {
    goto("/");
  }
</script>

<Grid>
  <Row>
    <Column style="margin-top: 6%;" lg={7}>
      {#if formSteps === 1}
        <ProgressIndicator preventChangeOnClick currentIndex={1}>
          <ProgressStep
            complete
            label="Step 1"
            description="The progress indicator will listen for clicks on the steps"
          />
          <ProgressStep
            disabled
            label="Step 2"
            description="The progress indicator will listen for clicks on the steps"
          />
        </ProgressIndicator>
      {:else if formSteps === 2}
        <ProgressIndicator preventChangeOnClick currentIndex={1}>
          <ProgressStep
            complete
            label="Step 1"
            description="The progress indicator will listen for clicks on the steps"
          />
          <ProgressStep
            complete
            label="Step 2"
            description="The progress indicator will listen for clicks on the steps"
          />
        </ProgressIndicator>
      {/if}

      <!--code for changing the title of forms-->
      {#if formSteps === 1}
        <div class="infoText">
          <h1>Tell us more about your</h1>
          <p>What's your project title? write your project</p>
        </div>
      {:else if formSteps === 2}
        <div class="infoText">
          <h1>Submit project</h1>
          <p>You are ready to submit your project</p>
        </div>
      {/if}
    </Column>
    <!-- Form column -->
    <!--en esta etiqueta la propiedad de margin-top: 6%, no entiendo el porque se puede usar.-->
    <Column
      style="	box-shadow: -1px -3px 5px 6px rgba(173, 173, 173, 0.99) inset;
		display: flex;
		flex-direction: column;
		border-radius: 5%;
		padding: 5%;
		width: 100%;
		height: 220vh;
		margin-top: 6%;
		"
    >
      {#if formSteps === 1}
        <Yourproject />
      {:else if formSteps === 2}
        <Submitproyect />
      {/if}

      {#if formSteps === 1}
        <Button
          class="buttonNext"
          style="position: relative; left: 25%; padding-left: 10em;   margin-top: 6%;"
          kind="secondary"
          on:click={increaseFormSteps}
        >
          Next
        </Button>
      {:else if formSteps === 2}
        <Button
          class="buttonNext"
          style="position: relative; left: 25%; padding-left: 10em;   margin-top: 6%;"
          kind="secondary"
          on:click={callToBackend}
        >
          Submit
        </Button>
      {/if}

      <Button
        style="position: relative; left: 25%; padding-left: 10em;   margin-top: 1%;"
        kind="ghost"
        on:click={decreaseFormSteps}
        >Back
      </Button>
    </Column>
  </Row>
</Grid>

<style>
  .infoText {
    margin-top: 10%;
  }

  .infoText h1 {
    font-weight: bold;
  }

  /* .setName { */
  /* border: 1px solid black; */
  /* box-shadow: -1px -3px 5px 6px rgba(173, 173, 173, 0.99) inset;
		display: flex;
		flex-direction: column;
		border-radius: 5%;
		padding: 10%;
		width: 100%;
		height: 120vh; */
  /* } */
</style>
