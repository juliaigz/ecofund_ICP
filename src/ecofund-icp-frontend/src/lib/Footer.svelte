<script>
  import { Grid, Row, Column } from "carbon-components-svelte";
  import imgFooterBurbujas from "$lib/images/imgFooterBurbujas.png";
  import { Button } from "carbon-components-svelte";
  import Add from "carbon-icons-svelte/lib/Add.svelte";
</script>

<hr />

<Grid id="Footer-Grid">
  <Row>
    <Column id="columna1">
      <figure>
        <img src={imgFooterBurbujas} alt="Logo de la Compañia" />
      </figure>

      <p>Ecofund <strong>ICP</strong></p>
    </Column>
    <Column id="columna2">
      <ul>
        <li>ABOUT</li>
        <li>HELP</li>
        <li>START A PROJECT</li>
        <li>CONTACT US</li>
      </ul>
    </Column>
    <Column id="columna3">
      <Button icon={Add} style="background-color:#59CF8C; width: 12.625rem;"
        >find a project</Button
      >
    </Column>
  </Row>
</Grid>

<style>
  :global(#Footer-Grid) {
    margin-top: 2%;
  }

  :global(#columna1) {
    display: flex;
    gap: 5%;
    margin-top: 5%;
  }

  :global(#columna2) {
    margin-top: 5%;
  }

  :global(#columna3) {
    margin-top: 5%;
  }

  hr {
    margin-top: 12%;
    width: 100%;
  }

  ul li {
    padding: 5%;
  }

  @media (max-width: 435) {
    :global(#Footer-Grid) {
      margin-top: 15%;
      border: 1px solid green;
    }
  }
</style>
