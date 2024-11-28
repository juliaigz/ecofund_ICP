// vite.config.js
import { fileURLToPath, URL } from "url";
import { sveltekit } from "file:///home/estebanhl/Desktop/ecofund_ICP/node_modules/@sveltejs/kit/src/exports/vite/index.js";
import { defineConfig } from "file:///home/estebanhl/Desktop/ecofund_ICP/node_modules/vite/dist/node/index.js";
import { optimizeCss } from "file:///home/estebanhl/Desktop/ecofund_ICP/node_modules/carbon-preprocess-svelte/dist/index.js";
import environment from "file:///home/estebanhl/Desktop/ecofund_ICP/node_modules/vite-plugin-environment/dist/index.js";
import dotenv from "file:///home/estebanhl/Desktop/ecofund_ICP/node_modules/dotenv/lib/main.js";
var __vite_injected_original_import_meta_url = "file:///home/estebanhl/Desktop/ecofund_ICP/src/ecofund-icp-frontend/vite.config.js";
dotenv.config({ path: "../../.env" });
var vite_config_default = defineConfig({
  build: {
    emptyOutDir: true
  },
  optimizeDeps: {
    esbuildOptions: {
      define: {
        global: "globalThis"
      }
    },
    exclude: [
      "carbon-components-svelte",
      "carbon-pictograms-svelte",
      "@dfinity/identity"
      // Aquí agregamos @dfinity/identity
    ]
  },
  server: {
    proxy: {
      "/api": {
        target: "http://127.0.0.1:4943",
        changeOrigin: true
      }
    },
    cors: false
  },
  plugins: [
    sveltekit(),
    environment("all", { prefix: "CANISTER_" }),
    environment("all", { prefix: "DFX_" }),
    optimizeCss()
  ],
  resolve: {
    alias: [
      {
        find: "declarations",
        replacement: fileURLToPath(new URL("../declarations", __vite_injected_original_import_meta_url))
      }
    ]
  }
});
export {
  vite_config_default as default
};
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsidml0ZS5jb25maWcuanMiXSwKICAic291cmNlc0NvbnRlbnQiOiBbImNvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9kaXJuYW1lID0gXCIvaG9tZS9lc3RlYmFuaGwvRGVza3RvcC9lY29mdW5kX0lDUC9zcmMvZWNvZnVuZC1pY3AtZnJvbnRlbmRcIjtjb25zdCBfX3ZpdGVfaW5qZWN0ZWRfb3JpZ2luYWxfZmlsZW5hbWUgPSBcIi9ob21lL2VzdGViYW5obC9EZXNrdG9wL2Vjb2Z1bmRfSUNQL3NyYy9lY29mdW5kLWljcC1mcm9udGVuZC92aXRlLmNvbmZpZy5qc1wiO2NvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9pbXBvcnRfbWV0YV91cmwgPSBcImZpbGU6Ly8vaG9tZS9lc3RlYmFuaGwvRGVza3RvcC9lY29mdW5kX0lDUC9zcmMvZWNvZnVuZC1pY3AtZnJvbnRlbmQvdml0ZS5jb25maWcuanNcIjtpbXBvcnQgeyBmaWxlVVJMVG9QYXRoLCBVUkwgfSBmcm9tIFwidXJsXCI7XG5pbXBvcnQgeyBzdmVsdGVraXQgfSBmcm9tIFwiQHN2ZWx0ZWpzL2tpdC92aXRlXCI7XG5pbXBvcnQgeyBkZWZpbmVDb25maWcgfSBmcm9tIFwidml0ZVwiO1xuaW1wb3J0IHsgb3B0aW1pemVDc3MgfSBmcm9tIFwiY2FyYm9uLXByZXByb2Nlc3Mtc3ZlbHRlXCI7XG5pbXBvcnQgZW52aXJvbm1lbnQgZnJvbSBcInZpdGUtcGx1Z2luLWVudmlyb25tZW50XCI7XG5pbXBvcnQgZG90ZW52IGZyb20gXCJkb3RlbnZcIjtcblxuZG90ZW52LmNvbmZpZyh7IHBhdGg6IFwiLi4vLi4vLmVudlwiIH0pO1xuXG5leHBvcnQgZGVmYXVsdCBkZWZpbmVDb25maWcoe1xuICBidWlsZDoge1xuICAgIGVtcHR5T3V0RGlyOiB0cnVlLFxuICB9LFxuICBvcHRpbWl6ZURlcHM6IHtcbiAgICBlc2J1aWxkT3B0aW9uczoge1xuICAgICAgZGVmaW5lOiB7XG4gICAgICAgIGdsb2JhbDogXCJnbG9iYWxUaGlzXCIsXG4gICAgICB9LFxuICAgIH0sXG4gICAgZXhjbHVkZTogW1xuICAgICAgXCJjYXJib24tY29tcG9uZW50cy1zdmVsdGVcIiwgXG4gICAgICBcImNhcmJvbi1waWN0b2dyYW1zLXN2ZWx0ZVwiLCBcbiAgICAgIFwiQGRmaW5pdHkvaWRlbnRpdHlcIiAvLyBBcXVcdTAwRUQgYWdyZWdhbW9zIEBkZmluaXR5L2lkZW50aXR5XG4gICAgXSxcbiAgfSxcbiAgc2VydmVyOiB7XG4gICAgcHJveHk6IHtcbiAgICAgIFwiL2FwaVwiOiB7XG4gICAgICAgIHRhcmdldDogXCJodHRwOi8vMTI3LjAuMC4xOjQ5NDNcIixcbiAgICAgICAgY2hhbmdlT3JpZ2luOiB0cnVlLFxuICAgICAgfSxcbiAgICB9LFxuICAgIGNvcnM6IGZhbHNlLFxuICB9LFxuICBwbHVnaW5zOiBbXG4gICAgc3ZlbHRla2l0KCksXG4gICAgZW52aXJvbm1lbnQoXCJhbGxcIiwgeyBwcmVmaXg6IFwiQ0FOSVNURVJfXCIgfSksXG4gICAgZW52aXJvbm1lbnQoXCJhbGxcIiwgeyBwcmVmaXg6IFwiREZYX1wiIH0pLFxuICAgIG9wdGltaXplQ3NzKCksXG4gIF0sXG4gIHJlc29sdmU6IHtcbiAgICBhbGlhczogW1xuICAgICAge1xuICAgICAgICBmaW5kOiBcImRlY2xhcmF0aW9uc1wiLFxuICAgICAgICByZXBsYWNlbWVudDogZmlsZVVSTFRvUGF0aChuZXcgVVJMKFwiLi4vZGVjbGFyYXRpb25zXCIsIGltcG9ydC5tZXRhLnVybCkpLFxuICAgICAgfSxcbiAgICBdLFxuICB9LFxufSk7XG5cbiJdLAogICJtYXBwaW5ncyI6ICI7QUFBc1csU0FBUyxlQUFlLFdBQVc7QUFDelksU0FBUyxpQkFBaUI7QUFDMUIsU0FBUyxvQkFBb0I7QUFDN0IsU0FBUyxtQkFBbUI7QUFDNUIsT0FBTyxpQkFBaUI7QUFDeEIsT0FBTyxZQUFZO0FBTDZNLElBQU0sMkNBQTJDO0FBT2pSLE9BQU8sT0FBTyxFQUFFLE1BQU0sYUFBYSxDQUFDO0FBRXBDLElBQU8sc0JBQVEsYUFBYTtBQUFBLEVBQzFCLE9BQU87QUFBQSxJQUNMLGFBQWE7QUFBQSxFQUNmO0FBQUEsRUFDQSxjQUFjO0FBQUEsSUFDWixnQkFBZ0I7QUFBQSxNQUNkLFFBQVE7QUFBQSxRQUNOLFFBQVE7QUFBQSxNQUNWO0FBQUEsSUFDRjtBQUFBLElBQ0EsU0FBUztBQUFBLE1BQ1A7QUFBQSxNQUNBO0FBQUEsTUFDQTtBQUFBO0FBQUEsSUFDRjtBQUFBLEVBQ0Y7QUFBQSxFQUNBLFFBQVE7QUFBQSxJQUNOLE9BQU87QUFBQSxNQUNMLFFBQVE7QUFBQSxRQUNOLFFBQVE7QUFBQSxRQUNSLGNBQWM7QUFBQSxNQUNoQjtBQUFBLElBQ0Y7QUFBQSxJQUNBLE1BQU07QUFBQSxFQUNSO0FBQUEsRUFDQSxTQUFTO0FBQUEsSUFDUCxVQUFVO0FBQUEsSUFDVixZQUFZLE9BQU8sRUFBRSxRQUFRLFlBQVksQ0FBQztBQUFBLElBQzFDLFlBQVksT0FBTyxFQUFFLFFBQVEsT0FBTyxDQUFDO0FBQUEsSUFDckMsWUFBWTtBQUFBLEVBQ2Q7QUFBQSxFQUNBLFNBQVM7QUFBQSxJQUNQLE9BQU87QUFBQSxNQUNMO0FBQUEsUUFDRSxNQUFNO0FBQUEsUUFDTixhQUFhLGNBQWMsSUFBSSxJQUFJLG1CQUFtQix3Q0FBZSxDQUFDO0FBQUEsTUFDeEU7QUFBQSxJQUNGO0FBQUEsRUFDRjtBQUNGLENBQUM7IiwKICAibmFtZXMiOiBbXQp9Cg==
