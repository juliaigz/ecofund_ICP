<script>
    async function transferICP() {
        const amount = prompt("¿Cuántos ICP deseas transferir?");
        const to = prompt("¿A qué dirección deseas transferir los ICP?");
        const memo = prompt("¿Algún mensaje que desees incluir?");

        const result = await window.ic.plug.requestTransfer({
            to,
            amount,
            memo,
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
        padding: 10px 20px;
        font-size: 16px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
</style>
