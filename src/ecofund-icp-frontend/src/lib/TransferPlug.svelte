<script>
    export let amount;
    async function transferICP() {
        // developer wallet
        // const memo = prompt("¿Algún mensaje que desees incluir?");

        const result = await window.ic.plug.requestTransfer({
            to: "5y3sh-tmxh2-3mw37-2u5cc-jztqx-6zlty-qvzxy-zdsvp-rjjmz-5thhd-3ae",
            amount,
            // memo,
        });

        if (result) {
            alert("Transferencia realizada con éxito");
            console.log(result);
        } else {
            alert("Error al realizar la transferencia");
        }
    }
</script>

<button on:click={transferICP}>Transferir ICP</button>

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
