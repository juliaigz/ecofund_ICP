<script>
  // import "../index.scss";
  import { backend } from "$lib/canisters";

  //*IMPORTACION DE IMAGENES PARA LOS AVALES, PERU, COLOMBIA
  //* Y ECUADOR
  import ColombiaAval from "$lib/images/ColombiaAval.png";

  import Sinba from "$lib/images/Sinba.jpg";
  import Reciclaje from "$lib/images/ Reciclaje.jpg";
  

  // import PeruAval from "$lib/images/PeruAval.jpg";
  // import EcuadorAval from "$lib/images/EcuadorAval.jpg";
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



    <!--*Codigo sobre los 3 proyectos de aval, Sinba, Colombia, Reciclaje-->

    <div id="ComoFuncionaCajas"> <!--Contenedor principal donde estan los 3 proyectos-->
      <div class="cajasFuncionamiento">
        <h3>Escoge un proyecto</h3>
        <p>
          Loggeate con tu billatera ICP y busca por categoria y encuentra un
          emprendedor a quien apoyar
        </p>
      </div>
      <div class="cajasFuncionamiento">
        <h3>Realiza un movimiento</h3>
        <p>Puedes apoyar poniendo en prenda tus near</p>
      </div>
      <div class="cajasFuncionamiento">
        <h3>Recibe el reembolso</h3>
        <p>
          Cuando los prestatarios paguen su financiamiento después del periodo
          de tiempo pactado, automáticamente se hará el reemboloso de tus ICP
        </p>
      </div>
      <div class="cajasFuncionamiento">
        <h3>Repetir</h3>
        <p>
          Puedes liberar tus fondos a tu billatera ICP ao volver a avalar a otro
          emprendedor, una vez que avalas a alguien ya puedes ser avalado en el
          futuro en esa nuestra tribu.
        </p>
      </div>
    </div> 



    <div id="ComoFuncionaCajas">
      <Features />
    </div>
  </section>

  <!--**SECCION DE LOS AVALACION DE PROYECTOS (QUE SON LAS 3 IMAGENES)-->
  <section id="Seccion3">
    <div id="ContenedorTitulo">
      <h2>Avala los proyectos que te importan</h2>
    </div>




    <!--***Aqui inicia sobre las 3 imagenes sobre Sinba, colombia y reciclaje***-->

          <!--Cajas sobre las imagenes-->
    <div id="ContenedorProyectos">
      <!--Cuadro sobre la fundación Sinba-->
      <div class="ProyectoAval"> 
        <div id="CajaImgSinba" >
          <figure id="CajaSinba">
            <img id="SinbaImg"  src={Sinba} alt="Aval sobre la fundación sinba" />
            <figcaption>Sinba.icp</figcaption>
          </figure>
        </div>
            <!--INFORMACION DE SINBA -->
        <div class="informacionAvales">
            <h4>Lima, PERU</h4>
            <div><!--aqui va la barra de informacion--></div>
            <h5>Peru</h5>
            <p>Un naval de 500 ICP puede ayudar con el gestion de alimentos en Sinba</p>
        </div>
      </div>  

      <!--Cuadro sobre Aval de Colombia-->
      <div class="ProyectoAval">         
        <figure id="CajaColombia" >
          <img id="ColombiaImg"  src={ColombiaAval} alt="Aval Sobre el país Colombia con un hermosa Vista" />
          <figcaption>Lupitag1.icp</figcaption>
        </figure>
            <!--INFORMACION DE COLOMBIA -->
        <div class="informacionAvales">
          <h4>Lima, PERU</h4>
          <div><!--aqui va la barra de informacion--></div>
          <h5>Peru</h5>
          <p>Un naval de 500 ICP puede ayudar con el gestion de alimentos en Sinba</p>
      </div>


      </div>
   

     <!--Cuadro sobre el aval de la imagen del reciclado--> 
      <div class="ProyectoAval">        
        <figure id="CajaReciclado" >
          <img id="RecicladoImg" src={Reciclaje} alt="Aval sobre el tema de reciclaje" />
          <figcaption>raee.icp</figcaption>
        </figure>
          <!--INFORMACION DE RECICLAJE -->
        <div class="informacionAvales">
          <h4>Lima, PERU</h4>
          <div><!--aqui va la barra de informacion--></div>
          <h5>Peru</h5>
          <p>Un naval de 500 ICP puede ayudar con el gestion de alimentos en Sinba</p>
        </div>
      </div>



    </div> 
  </section>




  <!--**Pie de Pagina-->
  <section> 
  <footer>
    <div></div>
  </footer>

    <Cards />
  </section>
</main>

<style>
  * {
    padding: 0;
    margin: 0;
  }

  /* img {
    width: 100px;
    height: 50px;
  } */

  /**DISEÑO DEL ENCABEZADO*/

  #Seccion1 {
    /* width: 100%; */
    /* height: 28em; */
    /* width: 100vw; */
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

  .dos-cajas {
    display: flex;
    gap: 100px;
    align-content: flex-start;
    flex-wrap: wrap;
    flex-direction: column;
  }

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

  #ContenedorProyectos {
    display: flex;
    justify-content: space-around;
    align-items: center;
    margin-top: 80px;
  }



 /**Caja sobre la principal 3 de cada uno*/

  .ProyectoAval {
    width: 16em;
    height: 25em;
    padding:0;
    margin:0;
    border: 2px solid green;
    display: flex;
    justify-content:center;
    flex-direction: column;

  }

  #CajaImgSinba{
    display: flex;
    align-items: flex-start;
    width: 100%;
    height: auto;
    border: 2px solid black;
    object-fit: cover;
  }

  #CajaImgSinba figure img{
    display: flex;
    align-items:flex-start;
    object-fit: cover;
  }


  .informacionAvales{
    margin-top: 70px;
  }


  /**Diseño de la Caja Sinba y tambien sobre las medidas de la img*/
  #CajaSinba{ /**Caja Sinba (figure)*/
    width:16em;
    height: 10em;
    /* border:2px solid black; */

  }

  #SinbaImg{ /*Tamaño de la Imagen Sinba */
    width: 100%;
    height: 100%;
    object-fit: cover; 

  }

  /***Diseño de las caja de las informacion de los proyectos avales, Sinba, colombia, Reciclaje*/

  /* .CajasInfoAval{
    width:100%;
    border: 2px solid black;
    display:flex;
    display: block;
    margin-bottom: ;
  } */
  







  /***Diseño de la caja Colombia y tambien sobre las medidas de la img*/

  #CajaColombia{
    width: 16em;
    height: 10em;
    /* border:2px solid black; */

  }

  #ColombiaImg{
    width:100%;
    height:100%;
    object-fit: cover;
  }


  /**Diseño de la caja de Reciclaje y tambien sobre las medidas de la img*/

  #CajaReciclado{
    width:16em;
    height: 10em;
    /* border: 2px solid black; */

  }

  #RecicladoImg{
    width: 100%;
    height: 100%;
    object-fit: cover;
  }


</style>







