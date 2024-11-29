<script>
  import { Grid } from "carbon-components-svelte";
  import { ToastNotification } from "carbon-components-svelte";
  import { onMount } from "svelte";
  import { auth } from "$lib/store/auth";

  let owner = "";

  onMount(() => {
    if ($auth.loggedIn) {
      owner = $auth.principal.toString();
    } else {
      goto("/");
    }
  });
</script>

<Grid>
  <ToastNotification class="warning" kind="warning" lowContrast>
    <strong slot="title">Important information</strong>
    <strong slot="subtitle"
      >We are going to deposit the funds to the wallet with which you connected
      in the log in with this address:</strong
    >
    <strong slot="caption">{owner}</strong>
    <!--Aqui va la direccion de la wallet-->
  </ToastNotification>
</Grid>

<style>
  :global(.warning) {
    width: 100%;
  }
</style>
