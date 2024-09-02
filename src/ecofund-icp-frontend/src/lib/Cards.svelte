<script>
  import Sinba from "$lib/images/Sinba.jpg";
  import ColombiaAval from "$lib/images/ColombiaAval.png";
  import Reciclaje from "$lib/images/ Reciclaje.jpg";
  import { Grid, Row, Column, ImageLoader } from "carbon-components-svelte";
  
  //*Importacion componente button
  import { Button } from "carbon-components-svelte";
  import Add from "carbon-icons-svelte/lib/Add.svelte";

  //*Importaciones de las Imagenes de Perfil (Elipse)

  //Perfil Sinba
  import ElipseSinba from "$lib/images/ElipseSinba.png";

  //Perfil LUIS (colombia)
  import ElipseColombia from"$lib/images/ElipseColombia.png";

  //Perfil México
  import ElipseReciclaje from "$lib/images/ElipseReciclaje.png"


  //icon de ubicacion
  import bxs_map from "$lib/images/bxs_map.png";


</script>


<div class="subTitulo">
  <h2>endorse the projects that matter to you</h2>
</div>

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
<Row class={"class"} style=" grid-column-gap: 1rem;">
  
        <!--*Carta de la fundación Sinba-->
        <Column 
          style="
          padding:1.43rem;
          background-color: #EEEEEE;
          
          ">
          <ImageLoader src={Sinba} style="width: 12.75rem; height: 11.375rem; object-fit: cover;" alt="Aval sobre el proyecto Sinba"/>
          
          <div class="sinba">
            <img src={ElipseSinba} alt="Imagen de Perfil del Aval Sinba">
            <h5>SINBA.ICP</h5>
          </div>

          
          <!--contendedor de ubicacion-->
          <div class="Ubicacion">
            <img src={bxs_map} alt="Icono de Ubicacions">
            <h6>Lima, Peru</h6>
          </div>
        
           
           <p>This endorsement of 500 ICP is intended to strengthen Sinba's food and materials recycling management, which is an innovative project focused on waste reduction and the promotion of good practices.</p>
          <Button icon={Add} href="/project" style="background-color:#59CF8C; width: 12.625rem;"  >see project</Button>
        </Column>
    

        
      <!--*Carta de Colombia-->
      <Column style="
        padding:1.43rem;
        background-color: #EEEEEE;
      
      ">
        <ImageLoader src={ColombiaAval} style="width: 12.75rem; height: 11.375rem; object-fit: cover;" alt="Imagen sobre el aval de reciclaje Co"/>
        <div class="luis">
          <img src={ElipseColombia} alt="Imagen de Perfil del Aval Sinba">
          <h5>LUIS.ICPP</h5>
        </div>


          <!--contendedor de ubicacion-->
         <div class="Ubicacion">
            <img src={bxs_map} alt="Icono de Ubicacions">
            <h6>Cali, Colombia</h6>
          </div>
        
        <p>This guarantee of 250 ICP is intended to promote an innovative sustainable agriculture project. The project focuses on implementing agricultural practices that protect the environment, conserve natural resources and improve the quality of life of farmers and the community in general.</p>
        
        <Button icon={Add} style="background-color:#59CF8C; width: 12.625rem;" >see project</Button>

      </Column>
    
  
      <!--*Carta de Reciclaje-->
      <Column style="
        padding:1.43rem;
        background-color: #EEEEEE;
        
        ">
        <ImageLoader src={Reciclaje} style="width: 12.75rem; height: 11.375rem; object-fit: cover;" alt="Imagen sobre el aval de reciclaje Co"/>
        <div class="victor">
          <img src={ElipseReciclaje} alt="Imagen de Perfil del Aval Sinba">
          <h5>VICTOR.ICP</h5>
        </div>
        

        <!--contendedor de ubicacion-->
        <div class="Ubicacion">
          <img src={bxs_map} alt="Icono de Ubicacions">
          <h6>Cancún, México</h6>
        </div>





        <p>
          This guarantee of 100 ICP is intended to promote an innovative recycling project. The objective of the project is to promote sustainability and responsible waste management through the implementation of advanced technologies and efficient recycling practices.
        </p>
        
        
        <Button icon={Add}  style="background-color:#59CF8C; width: 12.625rem;">see project</Button>
    
      </Column>
    
    
  </Row>
</Grid>



<style>

    .subTitulo{
      margin-top: 10.194rem;
      display: flex;
      justify-content: center;
    }



    /**Diseño del nombre y de la imagen de perfil*/
    .sinba{
      width: 11.875rem;
      height: 4.063rem;
      display:flex;
      align-items: center;
      margin-top: 1.25rem;
    }

    .sinba img{
      margin-right:0.4rem;
    }

    .luis{
      width: 11.875rem;
      height: 4.063rem;
      display:flex;
      align-items: center;
      margin-top: 1.25rem;
    }

    .luis img{
      margin-right: 0.4rem;
    }

    .victor{
      width: 11.875rem;
      height: 4.063rem;
      display:flex;
      align-items: center;
      margin-top: 1.25rem;
    }

    .victor img{
      margin-right: 0.4rem;
    }

    p{
      width: 12.625rem;
      height:12.5rem ;
      font-size: 0.75rem;
      margin-bottom: 8.375rem;
    }





    /***Contenedores de la Ubicacion con el Icono*/
    .Ubicacion{
      display: flex;
      margin-top: 1.25rem;
      margin-bottom: 2.25rem;
      /* border: 2px solid red; */

    }

</style>