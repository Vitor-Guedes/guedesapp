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
    max-width: 500px;
    margin-bottom: 10px;
}

.tab-buttons {
    display: flex;
    gap: 10px;
}

button {
    padding: 10px;
    border: none;
    background: #eee;
    cursor: pointer;
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
</style>