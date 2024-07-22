<script>
    import Sinba from "$lib/images/Sinba.jpg";
    import ColombiaAval from "$lib/images/ColombiaAval.png";
    import Reciclaje from "$lib/images/ Reciclaje.jpg";
    import { Grid, Row, Column } from "carbon-components-svelte";


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
<hr>
<!--*CONTENEDOR SOBRE LA INFORMACIÓN SOBRE LAS INVERSIONES-->
<Grid narrow style="display:flex; justify-content: space-evenly; "> <!--Primera Columna-->

    <Row class={"class"} style="background-color: gray; width:14rem; height:68vh; display: flex; flex-direction: column; align-items: center;">
        <img src={Sinba} alt="Logo de la campaña de reciclaje">
      <Column style="text-align: center;">Sinba</Column>
    </Row>
    <!--Tarjeta 2-->
    <Row>
        <Column>Hola mundo</Column>
    </Row>
    
    <!--Tarjeta 3-->

    <Row>
        <Column>Tarjeta 3</Column>
    </Row>

</Grid>



<style>
   hr{
    width: 95%;
   } 

   img{
    object-fit: cover;
    width: 25%;
    grid: 23rem;
   }

  

   
</style>
