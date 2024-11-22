import { fileURLToPath, URL } from "url";
import { sveltekit } from "@sveltejs/kit/vite";
import { defineConfig } from "vite";
import { optimizeCss } from "carbon-preprocess-svelte";
import environment from "vite-plugin-environment";
import dotenv from "dotenv";

dotenv.config({ path: "../../.env" });

export default defineConfig({
  build: {
    emptyOutDir: true,
  },
  optimizeDeps: {
    esbuildOptions: {
      define: {
        global: "globalThis",
      },
    },
    exclude: [
      "carbon-components-svelte", 
      "carbon-pictograms-svelte", 
      "@dfinity/identity" // Aquí agregamos @dfinity/identity
    ],
  },
  server: {
    proxy: {
      "/api": {
        target: "http://127.0.0.1:4943",
        changeOrigin: true,
      },
    },
    cors: false,
  },
  plugins: [
    sveltekit(),
    environment("all", { prefix: "CANISTER_" }),
    environment("all", { prefix: "DFX_" }),
    optimizeCss(),
  ],
  resolve: {
    alias: [
      {
        find: "declarations",
        replacement: fileURLToPath(new URL("../declarations", import.meta.url)),
      },
    ],
  },
});

