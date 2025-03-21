import { defineConfig } from 'astro/config';
import tailwind from "@astrojs/tailwind";
import node from '@astrojs/node';
import react from "@astrojs/react";
export default defineConfig({
  site: 'https://oussamasah.github.io',
  base: 'protfolio',
  output: 'hybrid',
  adapter: node({
    mode: 'standalone'  // You can also use 'middleware' if that's your requirement
  }),
  integrations: [tailwind(), react()]
});