<script>
    import Loader from "./Loader.svelte";

    export let amount;
    export let principalId;
    let isLoading = false;

    async function transferICP() {
        // developer wallet 5y3sh-tmxh2-3mw37-2u5cc-jztqx-6zlty-qvzxy-zdsvp-rjjmz-5thhd-3ae
        isLoading = true;
        if (window.ic && window.ic.plug) {
            await window.ic.plug
                .requestTransfer({
                    to: principalId,
                    amount,
                })
                .then((result) => {
                    console.log(result);
                    isLoading = false;
                    alert("Transferencia realizada con éxito");
                })
                .catch((error) => {
                    isLoading = false;
                    console.error("Error al transferir ICP:", error);
                    alert("Conecta tu wallet para hacer la transferencia.");
                });
        } else {
            alert(
                "Por favor instala la extencion Plug Wallet para poder conectar tu wallet.",
            );
        }
    }
</script>

{#if isLoading}
    <Loader />
{:else}
    <button on:click={transferICP}>Transferir ICP</button>
{/if}

<style>
    button {
        /* padding: 10px 20px;
        font-size: 16px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer; */
        width: 125px;
        height: 25px;
        font-size: 14px;
        color: white;
        font-weight: bold;
        background-color: rgb(69, 233, 69);
        border-radius: 6px;
        border: 2px rgb(161, 159, 159) solid;
    }
</style>
