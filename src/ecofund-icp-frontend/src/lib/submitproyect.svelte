<script>
	import { ProgressIndicator, ProgressStep } from 'carbon-components-svelte';
	import { Grid, Row, Column } from 'carbon-components-svelte';
	import { TextInput } from 'carbon-components-svelte';
	import { MultiSelect } from 'carbon-components-svelte';
	import { TextArea } from 'carbon-components-svelte';
	import { FileUploader } from 'carbon-components-svelte';
	import { Button } from 'carbon-components-svelte';
    import { InlineNotification } from "carbon-components-svelte";

</script>

<Grid>
	<Row>
		<Column lg={7}>
			<ProgressIndicator preventChangeOnClick currentIndex={1}>
				<ProgressStep
					complete
					label="Step 1"
					description="The progress indicator will listen for clicks on the steps"
				/>
				<ProgressStep
					label="Step 2"
					description="The progress indicator will listen for clicks on the steps"
				/>
				<ProgressStep
					disabled
					label="Step 3"
					description="The progress indicator will listen for clicks on the steps"
				/>
				<ProgressStep
					disabled
					label="Step 4"
					description="The progress indicator will listen for clicks on the steps"
				/>
			</ProgressIndicator>

			<div class="infoText">
				<h1>Submti Project</h1>
				<p>You are ready to submit your project </p>
			</div>
		</Column>
		<!-- Form column -->
		<Column
			style="	box-shadow: -1px -3px 5px 6px rgba(173, 173, 173, 0.99) inset;
		display: flex;
		flex-direction: column;
		border-radius: 5%;
		padding: 5%;
		width: 100%;
		height: 220vh;"
		>
        
		</Column>
	</Row>
</Grid>

<style>
	.infoText {
		margin-top: 10%;
	}

    .infoText h1{
        font-weight: bold;
    }

	/* .setName { */
	/* border: 1px solid black; */
	/* box-shadow: -1px -3px 5px 6px rgba(173, 173, 173, 0.99) inset;
		display: flex;
		flex-direction: column;
		border-radius: 5%;
		padding: 10%;
		width: 100%;
		height: 120vh; */
	/* } */

	
</style>
