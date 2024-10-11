<script>
  import Loader from "../Loader.svelte";

  let isLoading = false;
  let isConnect = false;

  async function connectWallet() {
    isLoading = true;
    if (window.ic && window.ic.plug) {
      window.ic.plug
        .requestConnect()
        .then((wallet) => {
          // Aquí puedes realizar acciones con el wallet conectado
          console.log("Wallet conectado:", wallet);
          console.log(
            "Wallet address:",
            window.ic.plug.sessionManager.sessionData.accountId
          );
          console.log(
            "Wallet principal:",
            window.ic.plug.sessionManager.sessionData.principalId
          );
          window.alert(
            `Wallet conectado: ${window.ic.plug.sessionManager.sessionData.principalId}`
          );
          isConnect = true;
          isLoading = false;
        })
        .catch((error) => {
          // Manejo de errores al conectar el wallet
          console.error("Error al conectar el wallet:", error);
          window.alert("Error al conectar el wallet");
          isLoading = false;
        });
    } else {
      // console.error('La biblioteca de Plug Wallet no está disponible');
      window.alert(
        "Por favor instala la extencion Plug Wallet para poder conectar tu wallet."
      );
      isLoading = false;
    }
  }

  async function disconnectWallet() {
    if (window.ic && window.ic.plug) {
      window.ic.plug
        .disconnect()
        .then(() => {
          console.log("Wallet desconectado");
          window.alert("Wallet desconectado");
          isConnect = false;
        })
        .catch((error) => {
          console.error("Error al desconectar el wallet:", error);
          window.alert("Error al desconectar el wallet");
        });
    } else {
      window.alert(
        "Por favor instala la extencion Plug Wallet para poder conectar tu wallet."
      );
    }
  }
</script>

{#if isLoading}
  <Loader />
{:else if isConnect}
  <button on:click={disconnectWallet} class="connect-plug">Desconectar</button>
{:else}
  <button on:click={connectWallet} class="connect-plug">Conectar Wallet</button>
{/if}

<style>
  .connect-plug {
    border: none;
    font-style: normal;
    font-weight: bold;
    font-size: 16px;
    line-height: 24px;
    background: linear-gradient(
      94.95deg,
      #ffe701 -1.41%,
      #fa51d3 34.12%,
      #10d9ed 70.19%,
      #52ff53 101.95%
    );
    border-radius: 10px;
    color: #fff;
    padding: 6px 32px;
    cursor: pointer;
    transition:
      opacity 0.3s ease-in,
      transform 0.3s ease-in-out;
    transform: scale(1);
    width: 350px;
    height: 50px;
  }

  .connect-plug:hover {
    opacity: 0.94;
    transform: scale(1.02);
  }
</style>
