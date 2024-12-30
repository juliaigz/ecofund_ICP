<script>
  import { AspectRatio } from "carbon-components-svelte";

  //importación de la imagen home.png
  import home from "$lib/images/home.png";

  //Importacion de Grid
  import { Grid, Row, Column } from "carbon-components-svelte";
  import { Button } from "carbon-components-svelte";
  import Add from "carbon-icons-svelte/lib/Add.svelte";
</script>

<!-- <AspectRatio> -->
  <Grid style="display:grid; height:100%; place-items: center;">
    <Row class="Row-Hero">
      <!--Columna de Texto-->
      <Column class="Text-Hero" >           
        <h2>Collective donations to benefit the environment</h2>
        <p>
          Use your ICP to support environmental projects. Tomorrow you could
          also be helped. Join Ecofund and support sustainability.
        </p>

        <div class="Box-Button">
          <Button style="background-color:#59CF8C;" icon={Add}
            >Find a project</Button
          >
        </div>
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
<!-- </AspectRatio> -->

<style>



  img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  :global(.Text-Hero) h2 {
    margin-top: 6.6%;
    font-size: 3.3rem;
  }

  :global(.Text-Hero) p {
    margin-top: 10%;
    font-size: 1.56em;
  }

  .Box-Button {
    margin-top: 10%;
    position: relative;
    left: 35%;
  }


  /*Media Queries*/
  @media (max-width: 425px){  /*esta va a ser nuestra medida para mobile*/
    
  :global(.Text-Hero){
    width: 100%;
    /* background-color: red; */
    /* border: blue 2px solid ; */
  }

  :global(.Text-Hero) h2{
    font-size: 2.3rem;
    font-weight: 450;
    text-align: center;
  }

  :global(.Text-Hero) p{
    font-size: 1.2rem;
    text-align: center;
  }
  :global(.Row-Hero){
    border: 2px solid green;
    /* width: 100vw; */
  }

    img{
      width: 25em;
    }

  }




</style>
