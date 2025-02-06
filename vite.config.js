import { defineConfig } from "vite";
import symfonyPlugin from "vite-plugin-symfony";
import vue from '@vitejs/plugin-vue';

/* if you're using React */
// import react from '@vitejs/plugin-react';

export default defineConfig({
    plugins: [
        /* react(), // if you're using React */
        symfonyPlugin(),
        vue({
            template: {
                transformAssetUrls: {
                    base: null,
                    includeAbsolute: false
                }
            }
        })
    ],
    build: {
        rollupOptions: {
            input: {
                app: "./assets/app.js",
                user_bundle: './packages/UserBundle/assets/app.js'
            }
        },
    },
    server: {
        cors: {
            origin: 'http://dev.backend.com',
            credentials: true
        }
    }
});