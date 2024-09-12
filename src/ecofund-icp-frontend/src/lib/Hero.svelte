<script>
  import { AspectRatio } from "carbon-components-svelte";

  //importación de la imagen home.png
  import home from "$lib/images/home.png";

  //Importacion de Grid
  import { Grid, Row, Column } from "carbon-components-svelte";
</script>

<AspectRatio>
  <Grid style="display:grid; height:100%; place-items: center;">
    <Row>
      <!--Columna de Texto-->
      <Column>
        <h2>Collective endorsement for the benefit of he enviroment</h2>
        <p>
          Use your ICP to endorse enviromental projects and you will receive
          your money back with interest. Tomorrow you could also be endorsed.
          Join ecofund and support sustainability
        </p>
      </Column>

      <!--*Columna de Imagen-->
      <Column>
        <div>
          <img
            src={home}
            alt="Imagen de bievenida, una niña en un escritorio"
          />
        </div>
      </Column>
    </Row>
  </Grid>
</AspectRatio>

<style>
  img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
</style>
