<template>
    <header id="header" >
        <slot name="header">
            <div class="w-6/12 mx-auto shadow-md">
                <h1 class="text-indigo-500 text-2xl mb-6 px-6 py-2">Guedes App</h1>
            </div>
        </slot>
    </header>

    <main>
        <slot name="content">
            # Content
        </slot>
    </main>

   <footer id="footer">
        <slot name="footer">
            <div class="mt-6 mx-auto bg-white shadow-inner w-6/12 z-20 border-t-2 p-6 flex justify-center">
                <span class="block text-indigo-500 text-sm sm:text-center">
                    © 2023 Vitor Guedes Gomes™. All Rights Reserved.
                </span>
            </div>
        </slot>
   </footer>
</template>

<script>
// import Showcase from './components/Showcase.vue';

export default {
    name: 'BaseLayout',

    components: {
        // Showcase
    },

    created() {
        document.title = "Guedes App"
    },  

    data() {
        return {}
    }
}
</script>

<style setup>

#header {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    font-size: 2rem;
}

#footer {
    text-align: center;
    font-size: 1.5rem;
    position: fixed;
    border-top: 1px solid #ccc;
    box-shadow: 1px 1px 1px 3px rgba(0, 0, 0, 0.2);
    width: 100%;
    bottom: 0;
    left: 0;
    padding: 15px 5px;
    font-style: italic;
    font-weight: 900;
}

</style>