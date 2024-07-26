<script>
  import Sinba from "$lib/images/Sinba.jpg";
  import ColombiaAval from "$lib/images/ColombiaAval.png";
  import Reciclaje from "$lib/images/ Reciclaje.jpg";
  import { Grid, Row, Column, ImageLoader } from "carbon-components-svelte";
  
  //*Importacion componente button
  import { Button } from "carbon-components-svelte";
  import Add from "carbon-icons-svelte/lib/Add.svelte";

  //*Importaciones de las Imagenes de Perfil sobre los apoyos
  import apoyo1 from "$lib/images/apoyo1.png";
  import apoyo2 from "$lib/images/apoyo2.png";
</script>


<!--Grid sobre las secciones de inversión de Avales-->
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
<Grid narrow>  
<Row class={"class"} style="border: 2px solid black; grid-column-gap: 1rem;">
  
        <!--*Carta de la fundación Sinba-->
        <Column style="text-align: center; border: 2px solid green; padding:1.43rem;">
          <ImageLoader src={Sinba} style="width: 5vw; height: 20vh; object-fit: cover;" alt="Aval sobre el proyecto Sinba"/>
           <h5>SINBA.ICP</h5>
           <p>Lima, Peru</p>
           
           <p>This endorsement of 500 ICP is intended to strengthen Sinba's food and materials recycling management, which is an innovative project focused on waste reduction and the promotion of good practices.</p>
          <Button icon={Add} style="background-color:#59CF8C; width: 12.625rem;"  >see project</Button>
        </Column>
    
      <!--*Carta de Colombia-->
      <Column style="border: 2px solid green; padding:1.43rem;">
        <ImageLoader src={ColombiaAval} style="width: 5vw; height: 20vh; object-fit: cover;" alt="Imagen sobre el aval de reciclaje Co"/>
        <h5>LUIS.ICP</h5>
        <h6>Cali, Colombia</h6>
        
        <p>This guarantee of 250 ICP is intended to promote an innovative sustainable agriculture project. The project focuses on implementing agricultural practices that protect the environment, conserve natural resources and improve the quality of life of farmers and the community in general.</p>
        
        <Button icon={Add} style="background-color:#59CF8C; width: 12.625rem;" >see project</Button>

      </Column>
    
  
      <!--Carta de Reciclaje-->
      <Column style="border: 2px solid green; padding:1.43rem;">
        <ImageLoader src={Reciclaje} style="width: 5vw; height:20vh; object-fit: cover;" alt="Imagen sobre el aval de reciclaje Co"/>
        
        <h5>VICTOR.ICP</h5>
        <h6>Cancún, México</h6>
        <p>
          This guarantee of 100 ICP is intended to promote an innovative recycling project. The objective of the project is to promote sustainability and responsible waste management through the implementation of advanced technologies and efficient recycling practices.
        </p>
        
        
        <Button icon={Add}  style="background-color:#59CF8C; width: 12.625rem;">see project</Button>
    
      </Column>
    
    
  </Row>
</Grid>



<style>
  
</style>