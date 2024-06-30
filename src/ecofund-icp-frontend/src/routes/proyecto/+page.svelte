<script>
  import PorcentBarr from "$lib/PorcentBarr.svelte";
  import Perfil from "$lib/images/Perfil.png";
  import UbicacionImg from "$lib/images/UbicacionImg.png"
  import Sinba from "$lib/images/Sinba.jpg"
  import apoyo1 from "$lib/images/apoyo1.png"
  import apoyo2 from "$lib/images/apoyo2.png"
  import apoyo3 from "$lib/images/apoyo3.png"
  import apoyo4 from "$lib/images/apoyo4.png"

</script>

<main>
    <div id="cajaPrincipalInfo">
        <div id="ImgYFondo">
            <div id="ContendorImg">
                <figure>
                    <img src={Perfil} alt="Fotos de Perfil">
                </figure>
                <div id="NombreYBarra">
                    <p>Sinba.ICP</p>
                    <!--Barra de porcentaje-->
                    <PorcentBarr />
                    <div id="textosDeBarra">
                        <p>Faltan  49 dias</p>
                        <p>Faltan 500 ICP</p>
                    </div>
                    <div id="porcentajeAvaladoBarra">
                        <p>75% AVALADO</p>
                    </div>
                </div>
            </div>
            
        </div>

        <div id="TextoSobreProyecto">
            <p>
                Un aval de 500 ICP puede ayudar a Siban a poner su negocio de preparación de comida para las areas de perú
            </p>
            <figure id="CajaImgUbicacion">
                <img src={UbicacionImg} alt="Icono de ubicacion">
                <figcaption>Lima, Perú</figcaption>
            </figure>
            
        </div>
        

        <div id="CajaSinbaImg">
            <img src={Sinba} alt="">
        </div>




        <div id="ApoyoAvalesPerson">
            <div id="tituloApoyoAval">
            <h4>Otros avales que apoyaron este proyecto</h4>
            </div>
            
            <div id="ImganesApoyoAval">
                <div>
                    <img src={apoyo1} alt="">
                    <p>Rally.icp</p>
                </div>
                <div>
                    <img src={apoyo2} alt="">
                    <p>Renzorosi.icp</p>
                </div>
                <div>
                    <img src={apoyo3} alt="">
                    <p>Rodrigo.icp</p>
                </div>
                <div>
                    <img src={apoyo4} alt="">
                    <p>Sebasrojas.icp</p>
                </div>            
            
            
            </div>
        
        </div>



    </div>
</main>

<style>

    #cajaPrincipalInfo{
        width: 65%;
        height: 96em;
        border: 2px solid black;
        border-radius: 16px;
        
    }


    #ContendorImg{
        display: flex;
    }

    #textosDeBarra{
        display: flex;
        justify-content: space-between;
        align-items: flex-end;
        padding: 0;
        margin: 0;
    }
    #textosDeBarra p{
        margin:4px;
    }

    #porcentajeAvaladoBarra{
        display: flex;
        justify-content: flex-end;
        padding: 0;
        margin: 0;
    }

    #porcentajeAvaladoBarra p{
        margin: 0;
    }


    /**Diseño sobre el texto de información de Siban*/

    #TextoSobreProyecto{
        padding: 0 50px;
        width: 40em;
        /* border:2px solid black; */
        margin: 50px auto;
    }
    
    #TextoSobreProyecto p{
        font-size: 40px;
        font-family:sans-serif;
        text-align: justify;
        padding: 0;
        margin: 0;
    }


    #TextoSobreProyecto #CajaImgUbicacion img{
        width: 60px;
        justify-content:flex-start ;
       }

    
    #CajaImgUbicacion{
        width: 350px;
        display: flex;
        align-items: center;
        margin: 50px 2px;      
    }

    #CajaImgUbicacion figcaption{
        padding: 0 15px;
        font-size: 25px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;

    }



    #CajaSinbaImg{
        display: flex;
        justify-content: center;
    }
    #CajaSinbaImg img{
        width: 450px;
        object-fit: cover;
        border-radius: 1.3em;
        
    }




    /**SECCION DE DISEÑO DE LAS PERSONAS QUE SEGUN APOYARON AL PROYECTO*/

    #tituloApoyoAval{
        display: flex;
        justify-content: center;
        margin-top: 3em;
    }

    #tituloApoyoAval h4{
        font-size: 45px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        margin: 0;
        padding: 0;
    }




    #ImganesApoyoAval{
        width: 750px;
        display: flex;
        justify-content: space-between;
        margin-top: 3em;
        padding: 0 66px;

    }

    #ImganesApoyoAval img{
        width: 8em;
    }

    #ImganesApoyoAval p{
        display: flex;
        justify-content: center;

    }






</style>