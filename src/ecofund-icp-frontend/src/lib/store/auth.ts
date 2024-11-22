import { writable } from "svelte/store";
import { idlFactory } from "../../../../declarations/ecofund-icp-backend/";
import { Actor, HttpAgent } from "@dfinity/agent";
import type {
  HttpAgentOptions,
  ActorConfig,
  ActorSubclass,
  Identity,
} from "@dfinity/agent";
import type { _SERVICE } from "../../../../declarations/ecofund-icp-backend/ecofund-icp-backend.did";
import type { Principal } from "@dfinity/principal";

// Definimos una interfaz para las opciones que puede recibir createActor
interface ActorOptions {
  agentOptions?: HttpAgentOptions;
  actorOptions?: ActorConfig;
}

/**
 * Crea un actor para el canister Backend
 *
 * @param {ActorOptions} options - Opciones para configurar el agente y actor.
 * @returns {ActorSubclass<_SERVICE>} Un Actor configurado con la interfaz de _SERVICE
 */
export function createActor(
  options: ActorOptions = {}
): ActorSubclass<_SERVICE> {
  const hostOptions = {
    host:
      process.env.DFX_NETWORK === "ic"
        ? `https://${process.env.CANISTER_ID_ECOFUND_ICP_BACKEND}.ic0.app`
        : undefined,
  };

  if (!options.agentOptions) {
    options.agentOptions = hostOptions;
  } else {
    options.agentOptions.host = hostOptions.host;
  }

  const agent = new HttpAgent({ ...options.agentOptions });

  // Fetch root key for certificate validation during development
  if (process.env.DFX_NETWORK !== "ic") {
    agent.fetchRootKey().catch((err) => {
      console.warn(
        "Unable to fetch root key. Check to ensure that your local replica is running"
      );
      console.error(err);
    });
  }

  if (!process.env.CANISTER_ID_ECOFUND_ICP_BACKEND) {
    throw new Error(
      "CANISTER_ID_ECOFUND_ICP_BACKEND is not defined in the environment variables."
    );
  }

  // Crea el actor usando la interfaz Candid y el HttpAgent
  return Actor.createActor(idlFactory, {
    agent,
    canisterId: process.env.CANISTER_ID_ECOFUND_ICP_BACKEND,
    ...options.actorOptions,
  });
}
interface AuthState {
  loggedIn: boolean;
  actor: ActorSubclass<_SERVICE>;
  principal: Principal | null | undefined;
  identity: Identity | null | undefined;
}

// Estado de autenticación con Svelte store
export const auth = writable<AuthState>({
  loggedIn: false,
  actor: createActor(),
  principal: null,
  identity: null,
});
