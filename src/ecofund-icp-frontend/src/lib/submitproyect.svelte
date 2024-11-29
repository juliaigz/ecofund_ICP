<script>
  import { Grid } from "carbon-components-svelte";
  import { ToastNotification } from "carbon-components-svelte";
</script>

<Grid>
  <ToastNotification class="warning" kind="warning" lowContrast>
    <strong slot="title">Important information</strong>
    <strong slot="subtitle"
      >We are going to deposit the funds to the wallet with which you connected
      in the log in with this address:</strong
    >
    <strong slot="caption"
      >mbnw5-73gpb-axml4-tfodx-tz3ch-4iyvk-qdlh6-c7nir-4a2rc-6q43y-iqe</strong
    >
    <!--Aqui va la direccion de la wallet-->
  </ToastNotification>
</Grid>

<style>
  :global(.warning) {
    width: 100%;
  }
</style>
