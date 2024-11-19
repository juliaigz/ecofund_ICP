<script>
 import { ProgressIndicator, ProgressStep } from "carbon-components-svelte";
  import { Grid, Row, Column } from "carbon-components-svelte";
  import { TextInput } from "carbon-components-svelte";
  import { MultiSelect } from "carbon-components-svelte";
  import { TextArea } from "carbon-components-svelte";
  import { FileUploader } from "carbon-components-svelte";
  import { Button } from "carbon-components-svelte";


  import iconInternetIdentity from '$lib/images/internet-computer-icp-seeklogo.svg';






</script>


<div class="setName">
    <TextInput labelText="Project Name" placeholder="Project Name" />
</div>

<div class="MultiSelect">
    <MultiSelect
        titleText="Contact"
        label="Select contact methods..."
        items={[
            { id: '0', text: 'Animals' },
            { id: '1', text: 'Recycling' },
            { id: '2', text: 'Nature' },
            { id: '3', text: 'Carbon footprint' }
        ]}
        sortItem={() => {}}
    />
</div>


<Grid style="width: 100%; ">
    <Row>
        <Column>
            <div class="boxSocialMedia">
                <TextInput size="xl" labelText="Instagram Profile" placeholder="instagram.com/" />
                <TextInput size="xl" labelText="Facebook Profile" placeholder="facebook.com/" />

            </div>
        </Column>    
    </Row>
    <Row>
        <Column>
            <div class="boxSocialMedia2">
                <TextInput size="xl" labelText="Whatsapp Number" placeholder="+57 (304) 254 487 5" />
            </div>
        </Column>
    </Row>
</Grid>

<div class="inputProjectStory">
    <TextArea
        labelText="Description"
        placeholder="Project story"
        maxCount={1000}
    />
</div>


<h2>How much would you like to raise</h2>


<div class="inputIconTarget">
    <div class="targetAmount">
        <TextInput class="inputTarget" labelText="Enter target Amount" placeholder="" />
    </div>
    <img src={iconInternetIdentity} alt="Icon Internet Identity">
</div>




<div class="input_Project_Picture">
    <FileUploader
        multiple
        labelTitle="Upload files"
        buttonLabel="Add files"
        labelDescription="Share some pictures or designs of your project. The first image you upload will be the main photo of the project, the following ones will go in an image gallery. Max file size is 500kb. Supported file types are .jpg and .png."
        accept={['.jpg', '.png']}
        status="complete"
    />
</div>


<style>

.boxSocialMedia{
    display: flex;   
    gap: 5%; 
    margin-top: 2%;
}

.boxSocialMedia2{
    width: 100%;
    margin-top: 5%;
}

.inputProjectStory{
    width: 100%;
    margin-top: 5%;
}

h2{
    margin-top: 2.3em;
    font-weight: bold;
}




.inputIconTarget{
    width: 100%;
    display: flex;
    align-items: center;
    padding: 0;
    margin: 0;
}


.targetAmount{
    width: 60%;
    margin-top: 2.34em;
    display: flex;
    gap: 0;

}

.targetAmount :global(.inputTarget){
    width: 100%;
    height: 3rem;
}


.inputIconTarget img{
    width: 12%;
    margin-top: 9%;
}

.input_Project_Picture {
		margin-top: 9%;
	}











</style>