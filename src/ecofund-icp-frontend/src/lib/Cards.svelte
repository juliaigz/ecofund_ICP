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
  <h2>Support the causes that matter to you</h2>
</div>

<!--Grid sobre las secciones de inversión de Avales-->
<Grid class="Grid-1-Avales" narrow>
  <Row id="Row-Cards-Avales">
    <Column>Food</Column>
    <Column>Reciclyng</Column>
    <Column>Animals</Column>
    <Column>Agriculture</Column>
    <Column>Header</Column>
  </Row>
  <hr />
</Grid>

<!--*CONTENEDOR SOBRE LA INFORMACIÓN SOBRE LAS INVERSIONES-->
<Grid class="Grid-2-Cards" narrow>
  <Row class="row-projects">
    <!--*Carta de la fundación Sinba-->
    {#each projects as project (project.id)}
      <Column class="Column-Cards-Projects">
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


  :global(.row-projects) {
    width: 100%;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-column-gap: 1rem;
    grid-row-gap: 1rem;
    width: 100%;
    margin-top: 15px;
    display: flex;
    flex-wrap: wrap;
    
  }

  :global(.Column-Cards-Projects) {
    padding: 1.43rem;
    width: 24%;
    background-color: #eeeeee;
    /* border: 1px solid red; */
  }
  

  :global(.Grid-1-Avales) {
    width: 100%;
    display: flex;
    justify-content: center;
    /* border: 1px solid black; */
    font-size: 1.2em;
  }

  :global(#Row-Cards-Avales) {
    /* display:flex;
    justify-content: center;
    align-items: center; */
    width: 100%;
    /* border: 1px solid green; */
  }

  .subTitulo {
    margin-top: 10.194rem;
    display: flex;
    justify-content: center;
    width: 100%;
    padding: 2.5rem;
  }

  .subTitulo h2 {
    font-size: 2.5rem;
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


  /* !!AQUI ES EL MEDIA QUERIES */

  @media (max-width: 430px) {
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

    .subTitulo {
      width: 100vw;
      /* border: 1px solid blue; */
      margin-left: 15%;
    }

    .subTitulo h2 {
      font-size: 1.78rem;
      font-weight: bold;
      text-align: initial;
    }

    p {
      width: 12.625rem;
      height: 12.5rem;
      font-size: 1rem;
      width: 100%;
      margin-bottom: 8.375rem;
    }

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

    
  :global(.Grid-1-Avales) {
    width: 100%;
    display: flex;
    justify-content: center;
    /* border: 1px solid black; */
    font-size: 1em;
  }

  :global(#Row-Cards-Avales) {
     display:flex;
    justify-content: center;
    font-size: 0.88em;
    width: 100%;
    margin-left: 15%;
    gap: 0.1rem;
    /* border: 1px solid green; */
  }
    :global(.Grid-2-Cards) {
      margin: 0px;
      padding: 0px;
      margin-left: 7%;
    }

    :global(.row-projects) {
      display: grid;
      /* grid-template-columns: repeat(1, 1fr);
      grid-column-gap: 1rem;
      grid-row-gap: 1rem; */
      margin-top: 15px;
      width: 100vw;
      display: flex;
      flex-wrap: wrap;
    }

    :global(.Column-Cards-Projects) {
      display: flex;
      flex-wrap: wrap;
      margin-left: 15%;
      width: 100%;
    }
  } /*Aquí termina el media queries*/
</style>
