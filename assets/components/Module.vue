<template>
    <slot name="head">
        <div :id="'portfolio_modules_' + code">
            <p>{{ label }}</p>
        </div>
    </slot>

    <div>
        <ul>
            <li v-for="(value, key) in fields">
                <span>
                    {{ key }}: {{ value }}
                </span>
            </li>
        </ul>
    </div>
</template>

<script>

    export default {
        name: 'Module',
        
        props: ['code', 'label', 'fields'],

        data() {
            return {}
        }
    }

</script>