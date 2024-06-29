<script>
    // import { logoBurbujas } from "../../static/logoBurbujas.png";
    import ConnectPlug from "$lib/ConnectPlug.svelte";
</script>

<header>
    <nav>
        <!-- <img src={logoBurbujas} class="logo" alt="Logo de Burbujas" /> -->

        <ul>
            <li>Acerca</li>
            <li>Ayuda</li>
            <li>Empieza un Proyecto</li>
        </ul>
    </nav>
    <ConnectPlug/>
    <!-- <button id="button_Nav">Login with ICP</button> -->
</header>

<style>
    header {
        display: flex;
        align-items: center;
        padding: 0;
    }

    nav {
        width: 100%;
        display: flex;
        padding: 0 2em 0 2em;
        justify-content: space-evenly;
    }

    ul {
        display: flex;
        list-style: none;
    }

    ul li {
        padding: 1.5rem;
        font-family: "Courier New", Courier, monospace;
    }

    /* #button_Nav {
        width: 250px;
        background-color: rgb(49, 192, 49);
        border-radius: 15px;
        border: 0;
        font-size: 15px;
        color: #ffffff;
        float: right;
    } */
</style>
