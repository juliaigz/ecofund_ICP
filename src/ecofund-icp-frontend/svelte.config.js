import adapter from "@sveltejs/adapter-static";
import { optimizeImports } from "carbon-preprocess-svelte";
import { vitePreprocess } from "@sveltejs/vite-plugin-svelte";
/** @type {import('@sveltejs/kit').Config} */
const config = {
  kit: {
    // adapter-auto only supports some environments, see https://kit.svelte.dev/docs/adapter-auto for a list.
    // If your environment is not supported or you settled on a specific environment, switch out the adapter.
    // See https://kit.svelte.dev/docs/adapters for more information about adapters.
    adapter: adapter({
      pages: "dist",
      assets: "dist",
      fallback: undefined,
      precompress: false,
      strict: true,
      fallback: "index.html", // o cualquier otra página que quieras usar como fallback
    }),
  },
  preprocess: [vitePreprocess(), optimizeImports()],
};

export default config;
