<!-- <script>
    import Navbar from "$lib/Navbar.svelte";
</script>

<Navbar /> -->

<script lang="ts">
  import TopAppBar, { Row, Section, Title } from "@smui/top-app-bar";
  import IconButton from "@smui/icon-button";
  import Checkbox from "@smui/checkbox";
  import FormField from "@smui/form-field";

  let prominent = false;
  let dense = false;
  let secondaryColor = false;
</script>

<TopAppBar
  variant="static"
  {prominent}
  {dense}
  color={secondaryColor ? "secondary" : "primary"}
>
  <Row>
    <Section>
      <IconButton class="material-icons">menu</IconButton>
      <Title>Static</Title>
    </Section>
    <Section align="end" toolbar>
      <IconButton class="material-icons" aria-label="Download"
        >file_download</IconButton
      >
      <IconButton class="material-icons" aria-label="Print this page"
        >print</IconButton
      >
      <IconButton class="material-icons" aria-label="Bookmark this page"
        >bookmark</IconButton
      >
    </Section>
  </Row>
</TopAppBar>

<div>
  <FormField>
    <Checkbox bind:checked={prominent} />
    <span slot="label">Prominent</span>
  </FormField>
  <FormField>
    <Checkbox bind:checked={dense} />
    <span slot="label">Dense</span>
  </FormField>
  <FormField>
    <Checkbox bind:checked={secondaryColor} />
    <span slot="label">Secondary</span>
  </FormField>
</div>

<slot />
