<script>
  import Sinba from "$lib/images/Sinba.jpg";
  import ColombiaAval from "$lib/images/ColombiaAval.png";
  import Reciclaje from "$lib/images/ Reciclaje.jpg";
  import { Grid, Row, Column, ImageLoader } from "carbon-components-svelte";

  //*Importaciones de las Imagenes de Perfil sobre los apoyos
  import apoyo1 from "$lib/images/apoyo1.png";
  import apoyo2 from "$lib/images/apoyo2.png";
</script>

<Grid narrow>
  <Row>
    <Column>Food</Column>
    <Column>Reciclyng</Column>
    <Column>Animals</Column>
    <Column>Agriculture</Column>
    <Column>Header</Column>
  </Row>
</Grid>
<hr />
<!--*CONTENEDOR SOBRE LA INFORMACIÓN SOBRE LAS INVERSIONES-->
<Grid narrow style="display:flex; justify-content: space-around; ">
  <Row
    class={"class"}
    style="background-color: #EEEEEE; 
    width:23.375rem; 
    height:51.375rem; 
    display: flex; 
    flex-direction: column; 
    align-items: center;
    padding: 1.813rem;
    "
  >
    <ImageLoader src={Sinba} style="widht:19.75rem; height:18.375rem; " 
    
    alt="Logo de la campaña de reciclaje"
      
    />
    <Column style="text-align: center;">Sinba.ICP</Column>
  </Row>




  <Row

    style="background-color: gray; 
    width: 14rem; height: 68vh; 
    display: felx; flex-direction:column; 
    align-items: center;"
  >
    <ImageLoader src={ColombiaAval} alt="Loco de compaña sobre inversión en Colombia" />

    <div class="ImgYNombreUsuario">
      <ImageLoader src={apoyo2} alt="Imagen de perfil sobre Sinba" />
      <Column>Luis.ICP</Column>
    </div>
  </Row>

  <Row>
    <Column></Column>
  </Row>
</Grid>

<style>
  
</style>
