import "./app.css";

import router from './routes.js';
// import services from './services/Service';

import { createApp } from 'vue';
import App from './App.vue';

const _app = createApp(App)

_app.use(router);
// _app.use(services);

_app.mount('#app');