<template>
    <Layout>
        <template #header>
            <div class="w-6/12 mx-auto shadow-md">
                <h1 class="text-indigo-500 text-2xl mb-6 px-6 py-2">{{title}}</h1>
            </div>
        </template>
        <template #content>
            # Pagina em construção. Por favor aguarde
        </template>
    </Layout>
</template>

<script>
import Layout from '../Layout.vue';

export default {
    components: {
        Layout
    },

    name: 'Home',

    data() {
        return {
            title: "Vitor Guedes Gomes"
        }
    }
}
</script>