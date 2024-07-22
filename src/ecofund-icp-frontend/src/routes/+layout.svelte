<script>
    import "carbon-components-svelte/css/white.css"; // https://github.com/carbon-design-system/carbon-components-svelte?tab=readme-ov-file
    import Navbar from "$lib/Navbar.svelte";
    import Cards from "$lib/Cards.svelte";

</script>

<Navbar />
<slot />
<Cards />



<style>

</style>