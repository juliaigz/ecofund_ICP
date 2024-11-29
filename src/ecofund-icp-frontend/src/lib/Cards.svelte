<script>
  import Sinba from "$lib/images/Sinba.jpg";
  import ColombiaAval from "$lib/images/ColombiaAval.png";
  import Reciclaje from "$lib/images/ Reciclaje.jpg";
  import { Grid, Row, Column, ImageLoader } from "carbon-components-svelte";
  import { backend } from "$lib/canisters";

  //*Importacion componente button
  import { Button } from "carbon-components-svelte";
  import Add from "carbon-icons-svelte/lib/Add.svelte";

  //*Importaciones de las Imagenes de Perfil (Elipse)

  //Perfil Sinba
  import ElipseSinba from "$lib/images/ElipseSinba.png";

  //Perfil LUIS (colombia)
  import ElipseColombia from "$lib/images/ElipseColombia.png";

  //Perfil México
  import ElipseReciclaje from "$lib/images/ElipseReciclaje.png";

  //icon de ubicacion
  import bxsMap from "$lib/images/bxs_map.png";
  import whatsapp from "$lib/images/whatsapp.png";
  import { onMount } from "svelte";
  import person from "$lib/images/person.png";

  let projects = [];

  onMount(async () => {
    try {
      const response = await backend.showProjects();
      // Formatear los datos a un array más manejable
      projects = response.map(([id, data]) => ({
        id,
        ...data,
      }));
      console.log(projects);
    } catch (error) {
      console.log(error);
    }
  });
</script>

<div class="subTitulo">
  <h2>support the causes that matter to you</h2>
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
  <Row
    class={"class"}
    style="display: grid;
    grid-template-columns: repeat(3, 1fr); 
    grid-column-gap: 1rem;
    grid-row-gap: 1rem;
    margin-top: 15px;"
  >
    <!--*Carta de la fundación Sinba-->
    {#each projects as project (project.id)}
      <Column style="padding:1.43rem; background-color: #EEEEEE;">
        <!-- Imagen del proyecto -->
        <ImageLoader
          src={project.project_images.length > 0
            ? project.project_images[0]
            : Sinba}
          style="width: 12.75rem; height: 11.375rem; object-fit: cover;"
          alt={`Imagen del proyecto ${project.project_name}`}
        />

        <div class="sinba">
          <img
            src={person}
            alt={`Imagen de perfil del proyecto ${project.project_name}`}
          />
          <h5>{project.project_name}</h5>
        </div>

        <div class="boxInfoCenter">
          <!-- Contenedor de ubicación -->
          <div class="Ubicacion">
            <img src={whatsapp} alt="Icono de ubicación" />
            <h6>{project.whatsapp_prefix}{project.whatsapp_number}</h6>
          </div>

          <p>
            {project.project_description}
          </p>
        </div>

        <Button
          icon={Add}
          href={`/project/${project.id}`}
          style="background-color:#59CF8C; width: 12.625rem; position: relative; left:25%;"
          >See Project</Button
        >
      </Column>
    {/each}
  </Row>
</Grid>

<style>
  .subTitulo {
    margin-top: 10.194rem;
    display: flex;
    justify-content: center;
  }

  /**Diseño del nombre y de la imagen de perfil*/
  .sinba {
    width: 11.875rem;
    height: 4.063rem;
    display: flex;
    align-items: center;
    margin-top: 1.25rem;
    margin-left: 10%;
  }

  .sinba img {
    margin-right: 0.4rem;
    width: 30px;
    /* margin: 10px; */
  }
  /*
  .luis {
    width: 11.875rem;
    height: 4.063rem;
    display: flex;
    align-items: center;
    margin-top: 1.25rem;
    margin-left: 10%;
    }
    
    .luis img {
      margin-right: 0.4rem;
      }
      
      .victor {
    width: 11.875rem;
    height: 4.063rem;
    display: flex;
    align-items: center;
    margin-top: 1.25rem;
    margin-left: 10%;
  }

  .victor img {
    margin-right: 0.4rem;
  }
*/
  p {
    width: 12.625rem;
    height: 12.5rem;
    font-size: 1rem;
    width: 100%;
    margin-bottom: 8.375rem;
  }

  /***Contenedores de la Ubicacion con el Icono*/
  .Ubicacion {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 1.25rem;
    margin-bottom: 2.25rem;
    /* width: 100%; */
  }

  .Ubicacion img {
    width: 30px;
  }

  /*Esto diseño es sobre las 3 informaciones de cada carta*/
  .boxInfoCenter {
    width: 100%;
    height: auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    /*border: 1px solid black;*/
    margin: auto;
    padding: 0% 8%;
  }
</style>
