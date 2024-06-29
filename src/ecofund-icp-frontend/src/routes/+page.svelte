<script>
  import "../index.scss";
  import { backend } from "$lib/canisters";

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
        <h1>Aval colectivo a beneficio de la tribu</h1>
      </div>
      <div class="parraSecc1">
        <p>
          Puedes usar tus ICP para avalar un proyecto, los ICP que uses para
          avalar te serán 100% devueltos, después de que la persona a quien
          avales devuelva el dinero, mañana puedes tú también ser avalado.
        </p>
      </div>
      <button>encuentra un proyecto</button>
    </div>
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

    <div id="ComoFunciona">
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
  </section>

  <section id="Seccion3">
    <!--AVALANDO LOS PROYECTOS-->
    <h2>Avala los proyectos que te importan</h2>

    <div>
      <!--LIMA PERU-->
      <figure>
        <img src="" alt="" />
      </figure>
    </div>

    <div>
      <!--BOGOTA COLOMBIA-->
      <figure>
        <img src="" alt="" />
      </figure>
    </div>

    <div>
      <!--QUITO ECUADOR-->
      <figure>
        <img src="" alt="" />
      </figure>
    </div>
  </section>

  <footer>
    <div></div>
  </footer>
</main>

<style>
  /*Aqui solo un poco del diseño*/
  * {
    padding: 0;
    margin: 0;
  }

  img {
    width: 100px;
    height: 50px;
  }

  /*DISEÑO DEL ENCABEZADO*/

  #Seccion1 {
    width: 100%;
    height: 28em;
    border: 2px solid green;
  }

  #primerSeccion {
    display: block;
    padding: 5em 8em 0 8em;
    width: 30%;
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
    margin: 30px 0 20px 0;
    width: 100%;
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
  }

  /**DISEÑO DE LAS 4 CAJAS SOBRE COMO FUNCIONA**/

  #ComoFunciona {
    width: 100%;
    height: 44em;
    border: 2px solid black;
    display: flex;
    align-items: center;
    justify-content: space-around;
    gap: 200px;
    flex-wrap: wrap;
  }

  .cajasFuncionamiento {
    width: 23em;
    height: 13em;
    border: 2px solid black;
  }
</style>
