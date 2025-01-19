<script>
  //svelte components
  import { ProgressIndicator, ProgressStep } from "carbon-components-svelte";
  import { Grid, Row, Column } from "carbon-components-svelte";
  import { Button } from "carbon-components-svelte";
  import { goto } from "$app/navigation";
  import { backend } from "$lib/canisters";

  import Yourproject from "$lib/yourproject.svelte";
  import Submitproyect from "$lib/submitproyect.svelte";
  import { Principal } from "@dfinity/principal";
  import { onMount } from "svelte";
  import { auth } from "$lib/store/auth";

  //Codigo para cambiar las secciones de forms
  let formSteps = 1;
  const maxSteps = 2;
  let owner = "";

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

  async function generateUniqueId(data) {
    const encoder = new TextEncoder();
    const encoded = encoder.encode(data);
    const hashBuffer = await crypto.subtle.digest("SHA-256", encoded);
    const hashArray = Array.from(new Uint8Array(hashBuffer));
    const hashHex = hashArray
      .map((b) => b.toString(16).padStart(2, "0"))
      .join("");
    return hashHex.slice(0, 12); // Recortar para mantener el ID corto
  }

  // Objeto reactivo para almacenar los datos del proyecto
  let project = {
    principal_owner: "",
    project_name: "",
    categories: [],
    instagram_url: "",
    facebook_url: "",
    whatsapp_number: "",
    whatsapp_prefix: "",
    project_description: "",
    project_images: [],
    is_visible: true,
    target_percentage: [0], //opt
    target_amount: [0], //opt
    donated_amount: [0], //opt
  };

  // Función para enviar el proyecto al backend
  async function callToBackend() {
    try {
      const idProject = await generateUniqueId(
        `${project.project_name}-${Date.now()}`
      );

      console.log(
        "--------------------------------- data ---------------------------------"
      );
      console.log(idProject, project);
      console.log(
        "---------------------------------  ---------------------------------"
      );

      if ($auth.loggedIn) {
        // owner = $auth.principal.toString();
        project.principal_owner = owner;
        const result = await backend.addProject(idProject, project);
        if (result) {
          console.log("Project added successfully:", result);
          goto("/");
        } else {
          console.log("Project already exists or couldn't be added.");
        }
      } else {
        goto("/startproject");
      }
    } catch (error) {
      console.error("Error adding project:", error);
    }
  }

  onMount(() => {
    if ($auth.loggedIn) {
      owner = $auth.principal.toString();
    } else {
      goto("/");
    }
  });
</script>

<Grid>
  <Row class="Row-StartProject">
    <Column class="Column-StartProject-1" style="margin-top: 6%;" lg={7}>
      <ProgressIndicator class="ProgresIndicator-StartProject-Father" preventChangeOnClick currentIndex={formSteps - 1}>
        <ProgressStep
          complete
          label="Step 1"
          description="The progress indicator will listen for clicks on the steps"
        />
        <ProgressStep
          label="Step 2"
          description="The progress indicator will listen for clicks on the steps"
        />
        <!-- <ProgressStep
          disabled
          label="Step 3"
          description="The progress indicator will listen for clicks on the steps"
        />
        <ProgressStep
          disabled
          label="Step 4"
          description="The progress indicator will listen for clicks on the steps"
        /> -->
      </ProgressIndicator>

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
      class="Forms-StartProject"
    
    >
      {#if formSteps === 1}
        <Yourproject bind:project />
      {:else if formSteps === 2}
        <Submitproyect />
      {/if}

      {#if formSteps === 1}
        <Button
          class="buttonNext buttonNext-if"
          kind="secondary"
          on:click={increaseFormSteps}
        >
          Next
        </Button>
      {:else if formSteps === 2}
        <Button
          class="buttonNext buttonNext-elseIf"
          kind="secondary"
          on:click={callToBackend}
        >
          Submit
        </Button>
      {/if}

      <Button
        class="buttonBack"
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

  :global(.Forms-StartProject){
    box-shadow: -1px -3px 5px 6px rgba(173, 173, 173, 0.99) inset;
		display: flex;
		flex-direction: column;
		border-radius: 5%;
		padding: 5%;
		width: 100%;
		height: 150vh;
		margin-top: 6%;
  }

  :global(.buttonNext){
    position: relative; 
    left: 25%; 
    padding-left: 10em; 
    margin-top: 6%;

  }

  :global(.buttonNext-elseIf){
    position: relative; 
    left: 25%; 
    padding-left: 10em;   
    margin-top: 6%;

  }
  
  :global(.buttonBack){
    position: relative; 
    left: 25%; 
    padding-left: 10em;  
    border:1px solid black;
    margin-top: 1%;
  }


  /***MEDIA QUERIES****/



@media (max-width: 435px){
  :global(.Column-StartProject-1){
    margin-top: 10%;
    /* border: 1px solid black; */
  }


  :global(.Forms-StartProject){
    box-shadow: -1px -3px 5px 6px rgba(173, 173, 173, 0.99) inset;
		display: flex;
		flex-direction: column;
		border-radius: 5%;
		padding: 5%;
		width: 100%;
		height: 120vh;
		margin-top: 6%;
  }







  :global(.ProgresIndicator-StartProject-Father){
    margin-top: 18%;
  }

  :global(.buttonNext){
    width: 50%;
    padding-left:22%;
  }

  :global(.buttonNext-elseIf){
    width: 50%;
    padding-left:22%;
  }

  :global(.buttonBack){
    width:50%;
    padding-left:22%;
  }


}

</style>
