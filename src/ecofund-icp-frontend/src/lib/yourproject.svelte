<script>
  import {
    NumberInput,
    ProgressIndicator,
    ProgressStep,
  } from "carbon-components-svelte";
  import { Grid, Row, Column } from "carbon-components-svelte";
  import { TextInput } from "carbon-components-svelte";
  import { MultiSelect } from "carbon-components-svelte";
  import { TextArea } from "carbon-components-svelte";
  import { FileUploader } from "carbon-components-svelte";
  import { Button } from "carbon-components-svelte";

  import iconInternetIdentity from "$lib/images/internet-computer-icp-seeklogo.svg";
  import { Principal } from "@dfinity/principal";

  export let project = {
    project_name: "",
    categories: [],
    instagram_url: "",
    facebook_url: "",
    whatsapp_number: "",
    whatsapp_prefix: "+57",
    project_description: "",
    target_amount: [target],
    project_images: [],
  };

  let target = null;

  let selectedCategories = [];

  $: project.categories = selectedCategories.map(
    (id) => items.find((item) => item.id === id)?.text
  );

  function updateProjectField(field, value) {
    project = { ...project, [field]: value };
  }

  const items = [
    { id: "0", text: "Animals" },
    { id: "1", text: "Recycling" },
    { id: "2", text: "Nature" },
    { id: "3", text: "Carbon footprint" },
  ];
</script>

<div class="setName">
  <TextInput
    labelText="Project Name"
    placeholder="Project Name"
    bind:value={project.project_name}
  />
</div>

<div class="MultiSelect">
  <MultiSelect
    titleText="Select Categories"
    label="Choose categories..."
    {items}
    bind:selectedIds={selectedCategories}
  />
  <p>Selected Categories: {JSON.stringify(project.categories)}</p>
</div>

<Grid style="width: 100%; ">
  <Row>
    <Column>
      <div class="boxSocialMedia">
        <TextInput
          size="xl"
          labelText="Instagram Profile"
          placeholder="instagram.com/"
          required
          bind:value={project.instagram_url}
        />
        <TextInput
          size="xl"
          labelText="Facebook Profile"
          placeholder="facebook.com/"
          required
          bind:value={project.facebook_url}
        />
      </div>
    </Column>
  </Row>
  <Row>
    <Column>
      <div class="boxSocialMedia2">
        <NumberInput
          size="xl"
          labelText="Whatsapp Number"
          placeholder="3042544875"
          required
          bind:value={project.whatsapp_number}
        />
      </div>
    </Column>
  </Row>
</Grid>

<div class="inputProjectStory">
  <TextArea
    labelText="Description"
    placeholder="Project story"
    maxCount={1000}
    required
    bind:value={project.project_description}
  />
</div>

<h2>How much would you like to raise</h2>

<div class="inputIconTarget">
  <div class="targetAmount">
    <NumberInput
      class="inputTarget"
      labelText="Enter target Amount"
      placeholder="0"
      required
      bind:value={target}
    />
  </div>
  <img src={iconInternetIdentity} alt="Icon Internet Identity" />
</div>

<div class="input_Project_Picture">
  <FileUploader
    multiple
    labelTitle="Upload files"
    buttonLabel="Add files"
    labelDescription="Share some pictures or designs of your project. The first image you upload will be the main photo of the project, the following ones will go in an image gallery. Max file size is 500kb. Supported file types are .jpg and .png."
    accept={[".jpg", ".png"]}
    status="complete"
  />
  <!-- bind:value={project.project_images} -->
</div>

<style>
  .boxSocialMedia {
    display: flex;
    gap: 5%;
    margin-top: 2%;
  }

  .boxSocialMedia2 {
    width: 100%;
    margin-top: 5%;
  }

  .inputProjectStory {
    width: 100%;
    margin-top: 5%;
  }

  h2 {
    margin-top: 2.3em;
    font-weight: bold;
  }

  .inputIconTarget {
    width: 100%;
    display: flex;
    align-items: center;
    padding: 0;
    margin: 0;
  }

  .targetAmount {
    width: 60%;
    margin-top: 2.34em;
    display: flex;
    gap: 0;
  }

  .targetAmount :global(.inputTarget) {
    width: 100%;
    height: 3rem;
  }

  .inputIconTarget img {
    width: 12%;
    margin-top: 9%;
  }

  .input_Project_Picture {
    margin-top: 9%;
  }
</style>
