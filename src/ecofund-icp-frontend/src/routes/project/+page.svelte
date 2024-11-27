<script>
  import { Search } from "carbon-components-svelte";
  import { Grid, Row, Column } from "carbon-components-svelte";
  import { Content } from "carbon-components-svelte";
  import { ProgressBar } from "carbon-components-svelte";
  import {
    OrderedList,
    ListItem,
    Link,
    UnorderedList,
  } from "carbon-components-svelte";

  //import perfilIcon from
  import IconPerfil from "$lib/images/apoyo1.png";
  import Sinba from "$lib/images/Sinba.jpg";
  import ImgLocation from "$lib/images/bxs_map.png";
  import Robert from "$lib/images/Rober.png";
  import Pedro from "$lib/images/Pedro.png";
  import Manuel from "$lib/images/Manuel.png";
  import Luis from "$lib/images/Luis.png";
  import ProjectEndorsement from "$lib/ProjectEndorsement.svelte";
  import ElipseSinba from "$lib/images/ElipseSinba.png";
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
              src={ElipseSinba}
              alt="Profile icon of the background creator"
            />
          </figure>
          <ProgressBar
            value={100}
            max={200}
            labelText="Sinba"
            helperText="40 ICP of 200 ICP"
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

        <div class="boxTheFunds">
          <h3>The funds raised will be utilizad to:</h3>

          <div class="list_Box_The_Funds">
            <OrderedList>
              <ListItem>
                Enhance the development of our "Data Tracker" app, improving
                user experience and expanding functionalities.
              </ListItem>
              <ListItem>
                Develop and implement the Purchase Neuron System (PNS) for
                seamless transactions and data sales.
              </ListItem>
              <ListItem>
                Expand our marketing efforts to attract more users and data
                buyers to the platform.
              </ListItem>
              <ListItem>
                Establish partnerships with local merchants, e-wallet providers,
                and banks to integrate our POS system and promote data
                marketplace adoption.
              </ListItem>
            </OrderedList>
          </div>
        </div>

        <div class="boxThefunds2">
          <p>Link</p>

          <div class="Underlist-Links">
            <UnorderedList>
              <ListItem>Dfinity forum showcase</ListItem>
              <ListItem>Telegram mini-app(Full-on IC)</ListItem>
              <ListItem>Alpha-app</ListItem>
              <ListItem>Website</ListItem>
              <ListItem>X</ListItem>
              <ListItem>Whitepaper</ListItem>
            </UnorderedList>
          </div>
        </div>

        <div class="boxProjectTimeline">
          <h3>Project Timeline and Key milestones:</h3>
          <div class="Underlist-ProjectTime">
            <UnorderedList>
              <ListItem>Q2 2024: Launch of the Alpha App.</ListItem>
              <ListItem
                >Q3 2024: Launch of the App and of Bridge23 DAO.</ListItem
              >
              <ListItem
                >Future: Full rollout of the Data Marketplace and implementation
                of the Purchase Neuron System.</ListItem
              >
              <ListItem
                >Future: Expansion of partnerships with local merchants and
                integration of the POS system.</ListItem
              >
              <ListItem
                >Future: Introduction of comprehensive buyer interfaces and
                advanced data analytics tools.</ListItem
              >
              <ListItem
                >Future: Launch of the Index Data Set and separate user
                canisters for enhanced data security.</ListItem
              >
              <ListItem
                >Future: Continuous improvements based on community feedback and
                DAO governance.</ListItem
              >
            </UnorderedList>
          </div>
        </div>
      </Column>

      <!---------------------------------->
      <!-------ICP INVESTMENT FUND-------->
      <!---------------------------------->
      <Column id="ICP_Selection" lg={2}>
        <ProjectEndorsement />
        <div class="Box_Project_Creator">
          <div class="InfoProjectCreator">
            <h4>Project Creator</h4>
            <div class="boxImg">
              <img src={ElipseSinba} alt="Icon Perfil" />
            </div>
            <p>Konstain Nezovskii</p>
            <p>
              Hi, I'm Konstantin, an enginnering entrepreneur with a passion ofr
              divin innovation and positive change through blockchain
              technology. With an M.Sc in Art and adn M.Sc. in finance, and over
              7 years of global experience, I lead Bridge23, a groundbreaking
              project within the ICP
            </p>
          </div>

          <div class="Box_Link">
            <p>Join the twitter community</p>
            <a href="https://x.com/FareaNFts">https://x.com/FareaNFts</a>
          </div>

          <div class="Box_Link2">
            <p>Join the Discord commmunity</p>
            <a href="https://discord.gg/xaJhNbRt">https://discord.gg/xaJhNbRt</a
            >
          </div>
        </div>
      </Column>
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

  /*-------Desing "The Funds raised will be utilizad to"----------*/
  /* -------------------------------------------------------------*/

  .list_Box_The_Funds {
    margin: 3% 0%;
    padding: 0% 4.5%;
  }

  .boxThefunds2 {
    padding: 0% 5%;
  }

  /* -------------------------------------------------------------*/
  /*-------Desing "Project Timeline and Key milestones: "---------*/
  /* -------------------------------------------------------------*/

  .boxProjectTimeline {
    /* border:1px solid black; */
    margin-top: 9%;
    margin-bottom: 9%;
    padding: 0% 5%;
  }

  /* --------------------------------------------*/
  /*------- Design "Project Creator"-------------*/
  /* --------------------------------------------*/

  .Box_Project_Creator {
    /* border: 1px solid red; */
    width: 34vw;
    height: 73vh;
    position: relative;
    top: 23%;
    left: 35%;
  }

  .InfoProjectCreator {
    width: 100%;
    /* border: 1px solid blue; */
    margin-bottom: 5%;
  }

  .InfoProjectCreator h4 {
    font-size: 1.8rem;
    margin-bottom: 5%;
  }

  .boxImg {
    margin-bottom: 4%;
  }

  /*--------------------------------------------*/
  /*---------- Row for the carousel ------------*/
  /* -------------------------------------------*/
  /* 
	.boxSecondCarousel{
		border: 1px solid black;
		padding: auto;
		width: 100%;
	} */
</style>
