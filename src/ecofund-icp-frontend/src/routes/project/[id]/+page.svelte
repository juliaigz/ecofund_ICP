<script>
  import { Loading, Search } from "carbon-components-svelte";
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
  import Whatsapp from "$lib/images/whatsapp.png";
  import Robert from "$lib/images/Rober.png";
  import Pedro from "$lib/images/Pedro.png";
  import Manuel from "$lib/images/Manuel.png";
  import Luis from "$lib/images/Luis.png";
  import ProjectEndorsement from "$lib/ProjectEndorsement.svelte";
  import ElipseSinba from "$lib/images/ElipseSinba.png";

  import { onMount } from "svelte";
  import { goto } from "$app/navigation"; // Para redirecciones
  export let data;

  onMount(() => {
    console.log("project page data");
    console.log(data);
  });
</script>

<!-- <main> -->
<Content>
  {#if data}
    <!-- <Search size="sm" style="width: 55%;" /> -->

    <Grid
      style="border:0.1em solid black; border-radius: 2%; margin-top: 3%; box-shadow: -1px -3px 5px 6px rgba(173,173,173,0.99) inset;"
    >
      <Row>
        <Column lg={9}>
          <!-- <div class="ProjectInformation">
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
        </div> -->

          <h2>
            {data[0].project_name}
          </h2>

          <div class="boxNumber">
            <img src={Whatsapp} alt="Number Icon" />
            <p>{data[0].whatsapp_prefix} {data[0].whatsapp_number}</p>
          </div>
          <!-- <div class="boxLocation">
            <img src={ImgLocation} alt="Location Icon" />
            <p>Lima, Peru</p>
          </div> -->

          <div id="boxImgSinba">
            <img src={Sinba} alt="Logo Sinba" />
          </div>
          <div id="textInfo-Sinba">
            <p>
              {data[0].project_description}
            </p>
          </div>

          <!-- <div class="boxTheFunds">
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
                  Establish partnerships with local merchants, e-wallet
                  providers, and banks to integrate our POS system and promote
                  data marketplace adoption.
                </ListItem>
              </OrderedList>
            </div>
          </div> -->

          <!-- <div class="boxThefunds2">
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
          </div> -->
          <div class="categories-box">
            <p>Categories</p>

            <div class="underlist-categories">
              <UnorderedList>
                #{#each data[0].categories as categories}
                  <ListItem>{categories}</ListItem>
                {/each}
              </UnorderedList>
            </div>
          </div>

          <!-- <div class="boxProjectTimeline">
            <h3>Project Timeline and Key milestones:</h3>
            <div class="Underlist-ProjectTime">
              <UnorderedList>
                <ListItem>Q2 2024: Launch of the Alpha App.</ListItem>
                <ListItem
                  >Q3 2024: Launch of the App and of Bridge23 DAO.</ListItem
                >
                <ListItem
                  >Future: Full rollout of the Data Marketplace and
                  implementation of the Purchase Neuron System.</ListItem
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
                  >Future: Continuous improvements based on community feedback
                  and DAO governance.</ListItem
                >
              </UnorderedList>
            </div>
          </div> -->
        </Column>

        <!---------------------------------->
        <!-------ICP INVESTMENT FUND-------->
        <!---------------------------------->
        <Column id="ICP_Selection" lg={2}>
          <ProjectEndorsement destinationAddress={data[0].principal_owner} />
          <div class="Box_Project_Creator">
            <!-- <div class="InfoProjectCreator">
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
          </div> -->

            <div class="Box_Link">
              <p>Join the instagram community</p>
              <a
                href={data[0].instagram_url}
                target="_blank"
                rel="noopener noreferrer">{data[0].instagram_url}</a
              >
            </div>

            <div class="Box_Link2">
              <p>Join the facebook commmunity</p>
              <a
                href={data[0].facebook_url}
                target="_blank"
                rel="noopener noreferrer">{data[0].facebook_url}</a
              >
            </div>
          </div>
        </Column>
      </Row>
    </Grid>
  {:else}
    <Loading />
  {/if}
</Content>

<!-- </main> -->

<style>
  /**
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
*/

  h2 {
    color: #59cf8c;
  }

  /* .boxLocation {
    margin: 5% auto 5% auto;
    display: flex;
    align-items: center;
  }

  .boxLocation img {
    width: 5%;
  }

  .boxLocation p {
    margin-left: 2%;
  } */
  .boxNumber {
    margin: 5% auto 5% auto;
    display: flex;
    align-items: center;
  }

  .boxNumber img {
    width: 5%;
  }

  .boxNumber p {
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

  /* .list_Box_The_Funds {
    margin: 3% 0%;
    padding: 0% 4.5%;
  } */

  /* .boxThefunds2 {
    padding: 0% 5%;
  } */

  /*-------Desing "Categories box"----------*/
  /* -------------------------------------------------------------*/
  .categories-box {
    padding: 0% 5%;
  }

  /* -------------------------------------------------------------*/
  /*-------Desing "Project Timeline and Key milestones: "---------*/
  /* -------------------------------------------------------------*/

  /* .boxProjectTimeline {
    margin-top: 9%;
    margin-bottom: 9%;
    padding: 0% 5%;
  } */

  /* --------------------------------------------*/
  /*------- Design "Project Creator"-------------*/
  /* --------------------------------------------*/
  .Box_Project_Creator {
    width: 34vw;
    height: 73vh;
    position: relative;
    top: 23%;
    left: 35%;
  }
  /* --------------------------------------------

  .InfoProjectCreator {
    width: 100%;
    margin-bottom: 5%;
  }

  .InfoProjectCreator h4 {
    font-size: 1.8rem;
    margin-bottom: 5%;
  }
    
  .boxImg {
    margin-bottom: 4%;
  }
*/

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
