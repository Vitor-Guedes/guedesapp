<template>
    <Layout>
        <template #header>
            <div class="w-6/12 mx-auto shadow-md">
                <h1 class="text-indigo-500 text-2xl mb-6 px-6 py-2">{{title}}</h1>
            </div>
        </template>
        <template #content>
            <div id="main" class="container">
                <Tab :tabs>

                    <template v-for="tab in tabs" #[tab.name]>

                        <Portfolio v-bind="{...portfolios[tab.name]}" />

                    </template>

                </Tab>
                <p class="obs">
                    Obs: 
                    Aplicação esta em desenvolvimento. <br>
                    Os dados estão mocados apenas para demonstar o como o projeto pode ficar no final (MVP) do desenvolvimento. <br>
                    Objetovo é deixar totalmente dinâmico e configuravel, onde os usuários visitantes poderão criar de forma limitada um ou mais Curriculos. <br>
                    E onde o administrador pode incluir e altera os dados persistidos na base de dados, via autenticação.
                </p>
            </div>
        </template>
    </Layout>
</template>

<script>
import Layout from '../Layout.vue';
import Portfolio from '../components/Portfolio.vue';
import Tab from '../components/Tab.vue';

export default {
    name: 'Home',

    components: {
        Layout,
        Portfolio,
        Tab
    },

    data() {
        return {
            title: "Portfolio App",

            portfolios: {
                'portfolio_backend': {
                    name: "Vitor Guedes Gomes",
                    responsability: "Desenvolvedor Backend",
                    apresentation: "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.",

                    modules: [
                        {
                            code: 'professional_exp',
                            label: 'Experiência Profissional',
                            fields: {
                                empresa: 'Cazco Digital',
                                carbo: 'Desenvolvedor Backend'
                            }
                        },
                        {
                            code: 'academic_background',
                            label: 'Formação Academica',
                            fields: {
                                institution: 'Fatec - Jundiai',
                                course: 'Análise e desenvolvimento de Software'
                            }
                        },
                        {
                            code: 'technical_skills',
                            label: 'Habilidades Técnicas',
                            fields: {
                                'Linguagens e Frameworks': 'PHP, JavaScript, Laravel, PHP Slim, Phalcon, Magento 1.'
                            }
                        }
                    ],
                },

                'portfolio_fullstack': {
                    name: "Vitor Guedes Gomes",
                    responsability: "Desenvolvedor Fullstack",
                    apresentation: "Outro Lorem",

                    modules: [
                        {
                            code: 'professional_exp',
                            label: 'Experiência Profissional',
                            fields: {
                                empresa: 'Cazco Digital',
                                carbo: 'Desenvolvedor Backend'
                            }
                        }
                    ]
                }
            },

            tabs: [
                { name: 'portfolio_backend', label: 'Portfolio Backend'},
                { name: 'portfolio_fullstack', label: 'Portfolio FullStack' }
            ]
        }
    }
}
</script>

<style scoped>
* {
    box-sizing: border-box;
    padding: 0;
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
}

.container {
    width: 100%;
    min-width: 400px;
    padding: 5px 5px;
    margin: 20px 0px;
}

.obs {
    font-size: 0.80rem;
    font-style: italic;
    margin-top: 30px;
    text-align: center;
}

</style>