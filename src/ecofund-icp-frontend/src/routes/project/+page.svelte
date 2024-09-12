<script>
  import { Search } from "carbon-components-svelte";
  import { Grid, Row, Column } from "carbon-components-svelte";
  import { NumberInput } from "carbon-components-svelte";
  import { Button } from "carbon-components-svelte";
  import Add from "carbon-icons-svelte/lib/Add.svelte";

  //import perfilIcon from
  import IconPerfil from "$lib/images/apoyo1.png";
  import Sinba from "$lib/images/Sinba.jpg";
  import ImgLocation from "$lib/images/UbicacionImg.png";
  import Robert from "$lib/images/Rober.png";
  import Pedro from "$lib/images/Pedro.png";
  import Manuel from "$lib/images/Manuel.png";
  import Luis from "$lib/images/Luis.png";
</script>

<main>
  <Search size="sm" style="width: 55%;" />

  <Grid
    style="margin-top:1%;
          border:0.1em solid black;
          border-radius: 2%;
        
"
  >
    <Row style="margin-top:5%;">
      <Column lg={9}>
        <div class="ProjectInformation">
          <figure>
            <img
              src={IconPerfil}
              alt="Profile icon of the background creator"
            />
          </figure>
          <div id="ProgressBar">
            <!--Progress Bar CODE-->
          </div>
        </div>

        <h2>
          A guarantee of 500 ICP can help Sinba in its food and wate recycling
          business in Peru
        </h2>

        <div class="boxLocation">
          <img src={ImgLocation} alt="Location Icon" />
          <p>Lima, Peru</p>
        </div>

        <div id="boxImgSinba">
          <img src={Sinba} alt="Logo Sinba" />
        </div>
        <div id="textInfo-Sinba">
          <p>
            Sinba's mission is to give a new meaning to waste, to ensure that
            what was once garbage today becomes a vehicle for social and
            environmental transformation. Sinba is innovating waste management
            in Peru, converting organic waste into pig feed and maximizing the
            value of inorganic recyclables in partnership with formal recyclers.
            Today we collaborate with more than 20 companies and rescue around
            840 tons of organic waste per year, which generates a positive
            impact equivalent to planting 36 thousand trees. But this is just
            beginning! They want to multiply their positive impact by 10!
          </p>
        </div>

        <div id="boxOtherGuarantees">
          <h3>Other guarantees that supported this project</h3>
          <div class="Other-Guarantes-Perfil">
            <div class="IconPerfilBox">
              <img src={Robert} alt="IconPerfilRobert" />
              <p>Robert.ICP</p>
            </div>
            <div class="IconPerfilBox">
              <img src={Pedro} alt="IconPerfilPedro" />
              <p>Pedro.ICP</p>
            </div>
            <div class="IconPerfilBox">
              <img src={Luis} alt="IconPerfilLuis" />
              <p>Luis.ICP</p>
            </div>
            <div class="IconPerfilBox">
              <img src={Manuel} alt="IconPerfilManuel" />
              <p>Manuel.ICP</p>
            </div>
          </div>
        </div>
      </Column>

      <!---------------------------------->
      <!-------ICP INVESTMENT FUND-------->
      <!---------------------------------->
      <Column id="ICP_Selection" lg={2}>
        <div class="box-Ivestement">
          <div class="Icp-Investment-Fund">
            <p>Endorse this Project</p>
            <NumberInput hideSteppers label="ICP" value={0} />
            <Button
              icon={Add}
              style="width: 60%; position: relative; left: 20%; top:1%; background-color:#59CF8C;"
              >Endorse this project</Button
            >
          </div>
        </div>
      </Column>
    </Row>
  </Grid>
</main>

<style>
  main {
    margin-top: 3%;
    padding: 2%;
    /*border: 1px solid black;*/
  }

  h2 {
    color: #59cf8c;
  }

  .boxLocation {
    margin: 5% auto 5% auto;
    display: flex;
    align-items: center;
  }

  .boxLocation img {
    width: 5%;
  }

  .boxLocation p {
    margin-left: 2%;
  }

  #boxImgSinba {
    /* border: 1px solid black; */
    width: 50vw;
    height: 65vh;
  }
  #boxImgSinba img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 2%;
  }

  #textInfo-Sinba {
    margin-top: 1rem;
    margin-bottom: 4rem;
    width: 50vw;
    height: 40vh;
    /*border: 1px solid green;*/
  }

  /* ------------------------------------------*/
  /*-------Desing "Other Guaranteees"---------*/
  /* ----------------------------------------*/

  #boxOtherGuarantees {
    display: flex;
    justify-content: center;
    flex-direction: column;
    padding: 2%;
    /*border: 1px solid black;*/
  }

  #boxOtherGuarantees h3 {
    text-align: center;
  }

  .Other-Guarantes-Perfil {
    /*boxIconPerfil*/
    margin-top: 2%;
    margin-bottom: 2%;
    display: grid;
    grid-template-columns: 50% 50%;
    gap: 10%;
  }

  .IconPerfilBox {
    display: flex;
    align-items: center;
    gap: 1%;
  }

  /* ------------------------------------------*/
  /*-------"Endorse this Project"-------------*/
  /* ----------------------------------------*/

  .box-Ivestement {
    position: relative;
    left: 20%;
    top: 30%;
  }

  .box-Ivestement .Icp-Investment-Fund {
    border: 3px solid;
    box-shadow: 10px 20px 20px 40px #888888;

    display: flex;
    flex-direction: column;
    border-radius: 5%;
    padding: 10%;
    width: 35vw;
    height: 30vh;
  }

  .Icp-Investment-Fund p {
    margin-bottom: 5%;
  }
</style>
