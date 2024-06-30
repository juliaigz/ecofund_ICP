<script>
  import { backend } from "$lib/canisters";
  import home from "$lib/images/home.png";
  import Cards from "$lib/Cards.svelte";
  import Features from "$lib/Features.svelte";

  let greeting = "";

  function onSubmit(event) {
    const name = event.target.name.value;
    backend.greet(name).then((response) => {
      greeting = response;
    });
    return false;
  }
</script>

<main>
  <section id="Seccion1">
    <!--SECTION 1 INFO-->
    <div id="primerSeccion">
      <div id="cajaTextoH1">
        <h1>Aval colectivo a beneficio del medio ambiente</h1>
      </div>
      <div class="parraSecc1">
        <p>
          Usa tus ICP para avalar proyectos ambientales y recibirás tus ICP de
          vuelta con intereses. Mañana, tú también podrías ser avalado. Únete a
          Ecofund y apoya la sostenibilidad.
        </p>
      </div>
      <button>encuentra un proyecto</button>
    </div>

    <img src={home} alt="principal" />
  </section>

  <section id="Seccion2">
    <div id="tituloComoFunciona">
      <div id="tituloSec2">
        <h2>Cómo funciona</h2>
      </div>
      <div id="parrafoSec2">
        <p>
          Descubre cómo la tecnologia blockchain puede cambiarle la vida a
          alguien, al avalar un proyecto puedes apoyar las causas que te
          interesan y generar un impacto.
        </p>
      </div>
    </div>

    <Features />
  </section>

  <!--**SECCION DE LOS AVALACION DE PROYECTOS (QUE SON LAS 3 IMAGENES)-->
  <section id="Seccion3">
    <div id="ContenedorTitulo">
      <h2>Avala los proyectos que te importan</h2>
    </div>
    <Cards />
  </section>
</main>

<style>
  * {
    padding: 0;
    margin: 0;
  }
  /**DISEÑO DEL ENCABEZADO*/

  #Seccion1 {
    height: 100vh;
    display: flex;
    justify-self: center;
    align-items: center;
  }

  #primerSeccion {
    width: 750px;
    height: 500px;
    display: flex;
    flex-direction: column;
    padding: 6em 0em 6em 6em;
  }

  #primerSeccion h1 {
    font-size: 3.2em;
    font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
  }

  .parraSecc1 {
    width: 350px;
    display: flex;
    justify-content: center;
  }

  .parraSecc1 p {
    font-size: 15px;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
  }

  #Seccion1 button {
    margin-top: 24px;
    background-color: rgb(69, 233, 69);
    color: #ffffff;
    border-radius: 18px;
    border: 0;
    font-size: 18px;
    font-weight: bold;
    width: 250px;
    height: 40px;
  }

  /**SECCION 2 SOBRE LA PAGINA (COMO FUNCIONA)*/

  #Seccion2 {
    width: 100%;
  }

  #tituloComoFunciona {
    height: 6em;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
  }

  #tituloSec2 h2 {
    font-size: 42px;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    font-weight: bold;
    color: rgba(11, 11, 129, 0.705);
  }

  #parrafoSec2 p {
    width: 450px;
    text-align: center;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    padding: 8px;
  } /*!Termian el diseño sobre */

  /**DISEÑO DE LAS 4 CAJAS SOBRE COMO FUNCIONA**/

  #ComoFuncionaCajas {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
    width: 100%;
    height: 44em;
    gap: 100px;
    margin-top: 100px;
    margin-bottom: 100px;
  }

  .cajasFuncionamiento {
    width: 450px;
    height: 300px;
    background-color: #59cf8c29;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
  }

  /**AQUI INCIIA EL DISEÑO DEL LOS PROYECTOS AVALES, DONDE SE ENCUENTRAN 
    LAS TRES IMAGENES QUE SON Sinba, Colombia, Reciclaje 
  */

  #ContenedorTitulo {
    display: flex;
    justify-content: center;
  }
</style>
