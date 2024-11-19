<script>
  import { Search } from "carbon-components-svelte";
  import { Grid, Row, Column } from "carbon-components-svelte";
  import { Content } from "carbon-components-svelte";
  import { ProgressBar } from "carbon-components-svelte";

  //import perfilIcon from
  import IconPerfil from "$lib/images/apoyo1.png";
  import Sinba from "$lib/images/Sinba.jpg";
  import ImgLocation from "$lib/images/UbicacionImg.png";
  import Robert from "$lib/images/Rober.png";
  import Pedro from "$lib/images/Pedro.png";
  import Manuel from "$lib/images/Manuel.png";
  import Luis from "$lib/images/Luis.png";
  import ProjectEndorsement from "$lib/ProjectEndorsement.svelte";
</script>

<!-- <main> -->
<Content>
  <Search size="sm" style="width: 55%;" />

  <Grid
    style="border:0.1em solid black; border-radius: 2%; margin-top: 3%; box-shadow: -1px -3px 5px 6px rgba(173,173,173,0.99) inset;"
  >
    <Row>
      <Column lg={9}>
        <div class="ProjectInformation">
          <figure>
            <img
              src={IconPerfil}
              alt="Profile icon of the background creator"
            />
          </figure>
          <ProgressBar
            value={100}
            max={200}
            labelText="Upload status"
            helperText="40 MB of 200 MB"
            style="width:100%;"
          />
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

      <!-- --------------------------------- -->
      <!--        ICP Endorsement Fund       -->
      <!-- --------------------------------- -->
      <ProjectEndorsement />
    </Row>
  </Grid>
</Content>

<!-- </main> -->

<style>
  .ProjectInformation {
    display: flex;
    align-items: center;
    width: 100%;
    margin-top: 3%;
    padding: 1%;
  }

  .ProjectInformation figure {
    margin-right: 1.3%;
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
    width: 100%;
    height: 33%;
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
</style>
