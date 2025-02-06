<template>
    <slot name="header">
        <div id="portfolio_own_name" class="title">
            {{ name }}
        </div>
        <div id="portfolio_own_responsability" class="sub-title">
            {{ responsability }}
        </div>
    </slot>

    <slot name="body">
        <div id="portfolio_own_apresentation">
            <p>
                {{ apresentation }}
            </p>
        </div>
    </slot>

    <slot name="modules">
        <div id="portfolio_own_modules">

            <Module v-for="section in modules" v-bind="{...section}" />

        </div>
    </slot>
</template>

<script>
    import Module from './Module.vue';

    export default {
        name: 'Portfolio',

        components: {
            Module
        },

        props: ['name', 'apresentation', 'responsability', 'modules'],

        data() {
            return {
                
            }
        },
    }

</script>

<style setup>

.title {
    font-size: 1.75rem;
    margin-bottom: 5px;
    font-weight: bold;
}

.sub-title {
    font-size: 1rem;
    margin-bottom: 5px;
    font-weight: 500;
    font-style: italic;
    color: rgba(120, 120, 120, 1);
}

</style>