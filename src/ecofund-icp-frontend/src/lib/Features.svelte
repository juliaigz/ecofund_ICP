<script>
  import project from "$lib/images/project.png";
  import loan from "$lib/images/loan.png";
  import money from "$lib/images/money.png";
  import bussines from "$lib/images/bussines.png";

  import { Grid, Row, Column, ImageLoader } from "carbon-components-svelte";
</script>

<div class="howItWorks">
  <div class="howItWorks_Text">
    <h2>How it works?</h2>
    <p>
      Use your ICP to fund environmental projects and make a real impact.
      Together, we can build a sustainable future for all.<br />
      Join Ecofound and support our planet today!
    </p>
  </div>
</div>


<Grid style="display: grid; row-gap: 2em;" narrow>
  <Row style="column-gap:2rem;">
    <Column
      style="background-color:#E6E6E6;
        width:29.188rem;
        height:21.563rem;     "
    >
      <div class="Features-Box">
        <h3>Choose a project</h3>
        <p>
          Log in with your ICP wallet and search by category and find an
          entreperneur to support
        </p>
      </div>

      <div class="ImageBox">
        <img
          src={project}
          alt="Imagen sobre ayudar a emprendedores del medio ambiente"
        />
      </div>
    </Column>

    <Column
      style="background-color:#EAFDF2;
      width:29.188rem;
      height:21.563rem;
      
      "
    >
      <div class="Features-Box">
        <h3>Make a move</h3>
        <p>
          You can help an entrepreneur who helps the environment by donating
          your ICP
        </p>
      </div>

      <div class="ImageBox">
        <img
          src={loan}
          alt="Imagen sobre ayudar a emprendedores del medio ambiente"
        />
      </div>
    </Column>
  </Row>

  <Row style="column-gap: 2rem;">
    <Column
      style="background-color:#E2FAEE;
        width:29.188rem;
        height:21.563rem;
        
        "
    >
      <div class="Features-Box">
        <h3>Join the community</h3>
        <p>
          Join the community and social networks of the project you donate to so
          you can track your donation.
        </p>
      </div>

      <div class="ImageBox">
        <img id="community-img" src={money} alt="Imagen sobre reciviendo fondos" />
      </div>
    </Column>

    <Column
      style="background-color:#E6E6E6;
        width:29.188rem;
        height:21.563rem; "
    >
      <div class="Features-Box">
        <h3>Repeat</h3>
        <p>
          You can continue donating other projects or create your own and upload
          it to the platform to receive donations.
        </p>
      </div>

      <div class="ImageBox">
        <img
          src={bussines}
          alt="Imagen sobre ayudar a emprendedores del medio ambiente"
        />
      </div>
    </Column>
  </Row>
</Grid>

<style>
  .howItWorks {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 4.938rem;
  }

  .howItWorks_Text {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .howItWorks_Text p {
    text-align: center;
    font-size: 1.15rem;
    padding: 0 9rem;
  }

  .howItWorks p {
    padding: 0 9rem;
  }

  .Features-Box h3 {
    font-size: 1.5rem;
    /* border: 1px solid green; */
    margin-top: 2rem;
    margin-left: 7%;
    width: 23vw;
  }
  .Features-Box p {
    font-size: 1rem;
    width: 15vw;
    height: 15vh;
    margin-top: 6%;
    margin-left: 7%;
    /* border: 1px solid black; */
    position: relative;
  }

  .ImageBox {
    /*border: 1px solid green;*/
    width: 22vw;
    position: relative;
    left: 43%;
    bottom: 44%;
  }

  .ImageBox img {
    padding: 0px;
    object-fit: cover;
    width: 22vw;

    /* position: relative;
        left: 45%;
         border: 1px solid black;  
         */
  }



  @media (max-width: 425px){
    .howItWorks_Text p{
      width: 100vw;
      padding: 0 1.3em;
      margin-top: 1rem;
      margin-left: 4rem;
      text-align: initial;
      
    }
    
    .Features-Box h3{
      font-size: 1.5rem;
      width: 100%;
      text-align: center;
      font-weight: 450;
    }
    .Features-Box p{
      font-size: 0.84rem;
      text-align: center;
      width: 100%;
      margin-left: 0;
    }
    .ImageBox{
      width: 100%;
      left: 0;
      bottom: 0;
      display: flex;
      justify-content: center;
    }
    .ImageBox img:not(#community-img){
      width: 95%;
    } 

    .ImageBox img#community-img{
      width: 80%;
    }




  }  
  </style>
