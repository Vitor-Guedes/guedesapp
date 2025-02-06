<template>
    <slot name="header">
        <div id="portfolio_own_name">
            {{ name }}
        </div>
        <div id="portfolio_own_responsability">
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