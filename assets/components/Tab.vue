<template>
    <div class="tabs">
        <div class="tab-buttons">
            <button 
                v-for="(tab, index) in tabs" 
                :key="index" 
                :class="{ active: tab === activeTab }"
                @click="activeTab = tab">
                {{ tab.label }}
            </button>
        </div>
        
        <div class="tab-content">
            <slot :name="activeTab.name"></slot>
        </div>
    </div>
</template>

<script>

    export default {
        name: 'Tab',

        props: ['tabs'],

        beforeMount() {
            this.activeTab = this.tabs[0];
        },

        data() {
            return {
                activeTab: null
            }
        },
    }

</script>

<style scoped>
.tabs {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 10px;
    width: 100%;
    max-width: 100%;
    margin-bottom: 10px;
    box-shadow: 3px 3px 3px 1px rgba(0, 0, 0, 0.2);
}

.tab-buttons {
    display: flex;
    gap: 10px;
}

button {
    padding: 10px 15px;
    border: none;
    background: #eee;
    cursor: pointer;
    font-size: 2.25rem;
}

button.active {
    background: rgba(131,111,255, 0.90);
    color: white;
    border-radius: 50px;
}

.tab-content {
    margin-top: 10px;
    padding: 10px;
    border-top: 2px solid rgba(131,111,255, 1);
}

@media screen and (min-width: 420px) {
    button {
        font-size: 2rem;
    }
}

@media screen and (min-width: 660px) {
    button {
        font-size: 1rem;
    }
}

</style>