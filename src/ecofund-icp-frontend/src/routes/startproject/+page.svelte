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
  import { backend } from "$lib/canisters";

  import Yourproject from "$lib/yourproject.svelte";
  import Submitproyect from "$lib/submitproyect.svelte";
  import { Principal } from "@dfinity/principal";

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
    principal_owner: Principal.anonymous().toString(),
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

      const result = await backend.addProject(idProject, project);

      if (result) {
        console.log("Project added successfully:", result);
        goto("/");
      } else {
        console.log("Project already exists or couldn't be added.");
      }
    } catch (error) {
      console.error("Error adding project:", error);
    }
  }
</script>

<Grid>
  <Row>
    <Column style="margin-top: 6%;" lg={7}>
      <ProgressIndicator preventChangeOnClick currentIndex={1}>
        <ProgressStep
          complete
          label="Step 1"
          description="The progress indicator will listen for clicks on the steps"
        />
        <ProgressStep
          label="Step 2"
          description="The progress indicator will listen for clicks on the steps"
        />
        <ProgressStep
          disabled
          label="Step 3"
          description="The progress indicator will listen for clicks on the steps"
        />
        <ProgressStep
          disabled
          label="Step 4"
          description="The progress indicator will listen for clicks on the steps"
        />
      </ProgressIndicator>

      <div class="infoText">
        <h1>Tell us more about your</h1>
        <p>What's your project title? write your project :D</p>
      </div>
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
        <Yourproject bind:project />
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
