<script>
  import PorcentBarr from "$lib/PorcentBarr.svelte";
  import Perfil from "$lib/images/Perfil.png";
  import UbicacionImg from "$lib/images/UbicacionImg.png"
  import Sinba from "$lib/images/Sinba.jpg"
  import apoyo1 from "$lib/images/apoyo1.png"
  import apoyo2 from "$lib/images/apoyo2.png"
  import apoyo3 from "$lib/images/apoyo3.png"
  import apoyo4 from "$lib/images/apoyo4.png"
    import TransferPlug from "$lib/TransferPlug.svelte";

</script>

<main>
    <div>
        
    </div>
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


        <!--**Esctructura de codigo de "Otros avales que apoyaron este proyecto"-->

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


        <!--*Estructura de codigo de "Detalles de Avalamiento"-->

        <div id="ContenedorDetallesAvalamiento"> <!--Titulo "Detalles de avalamiento"-->
            <div id="TituloAvalamiento">
                <h4>Detalles del Avalamiento</h4>
            </div>

            <div id="ContDetallesAvalamiento">  <!--Lista sobre los detalles de avalamiento-->
                <ul>
                    <li>Tiempo de Avalalimiento: </li>
                    <li>Calendario de Reembolso: </li>
                    <li>Fecha de desembolso: </li>
                    <li>Modelo de Financiamiento: </li>
                </ul>
                <ul>
                    <li>24 meses</li>
                    <li>al final del periódo</li>
                    <li>--</li>
                    <li>flexible</li>
                </ul>
            </div>
        </div>
    </div>


    <!--*CAJA SOBRE LA CONVERSIÓÑ DEL AVAL (ICP)-->
    <div id="CajaConvierteAval">
        <div class="box">
            <select name="" id="">
                <option value="">1 ICP</option>
                <option value="">2 ICP</option>
                <option value="">3 ICP</option>
                <option value="">4 ICP</option>
                <option value="">5 ICP</option>
            </select>
        </div>
         <TransferPlug amount={1}/>
    </div>


</main>

<style>

    #cajaPrincipalInfo{
        width: 65%;
        height: 96em;
        border: 2px solid black;
        border-radius: 16px;
        padding-top: 16px;
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
        font-family:Verdana, Geneva, Tahoma, sans-serif;
        padding-top:1.3rem;
    }

    #porcentajeAvaladoBarra{
        display: flex;
        justify-content: flex-end;
        padding: 0;
        margin: 0;
    }

    #porcentajeAvaladoBarra p{
        margin: 0;
        font-family:Verdana, Geneva, Tahoma, sans-serif;
    }

    #NombreYBarra p{
        font-family:Verdana, Geneva, Tahoma, sans-serif;
    }


    /**Diseño sobre el texto de información de Siban el proyecto*/

    #TextoSobreProyecto{
        padding: 0 50px;
        width: 26em;
        /* border:2px solid black; */
        margin: 50px auto;
    }



    
    #TextoSobreProyecto p{
        font-size: 30px;
        font-family:Verdana, Geneva, Tahoma, sans-serif;
        padding: 0;
        margin: 0;
    }


    #TextoSobreProyecto #CajaImgUbicacion img{
        width: 60px;
        justify-content:flex-start;
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
        font-family:Verdana, Geneva, Tahoma, sans-serif;
    }



    /****Diseño de "Detalles de Avalamiento"****/

    /* #ContenedorDetallesAvalamiento{
        display: flex;
            
    } */
    #TituloAvalamiento{
        display: flex;
        justify-content: center;
        margin-top: 2em;
    }
    #TituloAvalamiento h4{
        font-size: 2em;
        font-family:Verdana, Geneva, Tahoma, sans-serif;
        margin: 0;
    }

    #ContDetallesAvalamiento{
        display: flex;
        justify-content: space-around;
        padding-top:10px;
    }

    #ContDetallesAvalamiento ul li{
        font-family:Verdana, Geneva, Tahoma, sans-serif;
        font-size: 18px;
        font-weight: 500;
    
    }

    #ContDetallesAvalamiento ul{
        list-style: none;
    }
    

    /***DISEÑÓ DE LA CAJA DE "CONVIERTE AVAL AHORA", que es la seccion de fondeo de la empresa*/

    #CajaConvierteAval{
        display: flex;
        align-items: center;
        justify-content: space-around;
        margin-top: 10em;
        width: 250px;
        height: 100px;
        border: 2px solid gray;
        border-radius: 8px;
    }                                                                                                                                                                                                                                                           

    /* #CajaConvierteAval button{
        width: 125px;
        height:25px;
        font-size: 14px;
        color: white;
        font-weight: bold;
        background-color: rgb(69, 233, 69);
        border-radius: 6px;
        border: 2px rgb(161, 159, 159) solid;
    } */

    #CajaConvierteAval select{
        
        width: 86px;
    }

    #CajaConvierteAval select option{
        text-align: center;
    }











    main{
        display: flex;
        gap: 4em;
    }

</style>