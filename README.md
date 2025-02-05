Criar portfólio editável com symfony, onde eu posso atualizar informações pessoais e profissionais.
##### **Ferramentas**:
- Php:8.3
- Symfony:7.2
- Vue:3
- Vue-Router
- Mongo:8
- Vite

##### **Estrutura**:
modules - Diretório com pacotes para ativar/desativar implementações.

##### **Front**:
Criado o front com vue e vue-router. 

Consumir o backend via api (criar medidas de segurança para evitar excesso de requisições). 

Definir *blocos* que podem ou não ser exibidos. Deve ser abstraído para poder reaproveitar em diferentes contextos e lugares.

##### **Backend**:
Fora o prefixo api e admin (cirar path admin dinâmico), sempre vai redirecionar para o index.php.

Criar **sistema de usuários**, onde o admin **master** tem acesso para criar e editar dados e usuários **guest** podem apenas visualizar dados e filtra-los.

Criar **sistema de Pacotes** que podem ser ativados/desativados via admin (master).

Criar testes unitários

##### **Entidades**:
User - usuários do sistema com diferentes funções.

| Campo    | Tipo         | Descrição                                                   |
| -------- | ------------ | ----------------------------------------------------------- |
| name     | string       | Nome do usuário                                             |
| email    | string       | Email de acesso do usuário                                  |
| password | string       | Senha do usuário                                            |
| roles    | array        | Regras do usuários, definições do que pode ou não ser feito |
| type     | enum(string) | O tipo do usuário (master, guest)                           |

Roles - Regras de ações que o usuário pode realizar.

| Campo      | Tipo         | Descrição                                                        |
| ---------- | ------------ | ---------------------------------------------------------------- |
| role_id    | uuid(string) | Identificador da regra                                           |
| read       | bool         | Se pode ler ou não os dados                                      |
| write      | bool         | Se pode ou não criar os dados                                    |
| update     | bool         | Se pode ou não editar os dados                                   |
| delete     | bool         | Se pode ou não deletar os dados                                  |
| action_ids | array        | Lista com ids de ações que devem serguir a regras de permissões. |

Actions - Ações do sistema que o usuário pode realizar.

| Campo     | Tipo         | Descrição                                                                                  |
| --------- | ------------ | ------------------------------------------------------------------------------------------ |
| action_id | uuid(string) | Identificador da ação                                                                      |
| code      | string       | Código da ação, seguir padrão com nome da rotas. (group.verb.context = api.store.activity) |

Portfolio - Lista de Portfólios, vai abstrair um currículo.

| Campo          | Tipo         | Descrição                                                                                                                                               |
| -------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id             | uuid(string) | Identificador do portfolio                                                                                                                              |
| name           | string       | Nome do proprietário do portfolio                                                                                                                       |
| apresentation  | Text(string) | Texto de apresentação                                                                                                                                   |
| responsability | string       | Cargo ou Responsabilidade do portfolio                                                                                                                  |
| modules        | array        | Array com chaves e ids dos módulos e identificadores dos dados. (['professional_experience': ['6ba1247x25eh8c75vfa2c412', '6ba1247x25eh8c75vfa2c412']]) |

Modules - Entidade que representa partes  do portfólio, são bloco de dados com campos dinâmicos que devem ser abstraídos como formulários no front.

| Campo       | Tipo         | Descrição                                       |
| ----------- | ------------ | ----------------------------------------------- |
| id          | uuid(string) | Identificador do portfolio                      |
| code        | string       | Código que identifica o tipo de bloco           |
| label       | string       | Titulo do bloco                                 |
| fields      | array        | Lista de campos que deve ser exibidos/recebidos |
| validations | array        | Validações que devem ser realizados por fiels   |

Modules Values - São os valores dos módulos

| Campo        | Tipo         | Descrição                                                                                        |
| ------------ | ------------ | ------------------------------------------------------------------------------------------------ |
| module_id    | uuid(string) | Identificador do modulo                                                                          |
| portfolio_id | uuid(string) | Identificador do portfólio                                                                       |
| values       | array        | Lista de chave e valores com os campos do módulos como chave o inputs vindo do form como valores |

#### **Todo**:
- [ ] Backend:
	- [ ] Tabelas, Migração e seeds
		- [ ] users
		- [ ] roles
		- [ ] actions
		- [ ] portfolios
		- [ ] modules
		- [ ] modules_values
	- [ ] Testes
		- [ ] UserTest - feature/unit
		- [ ] RoleTest - feature/unit
		- [ ] ActionTest - feature/unit
		- [ ] PortfolioTest - feature/unit
		- [ ] ModuleTest - feature/unit
		- [ ] ModulesValueTest - feature/unit
	- [ ] Documentação da Api
	- [ ] Implementações de segurança
- [ ] Front:
	- [ ] Rotas / Pages
		- [ ] Admin
		- [ ] Guest
		- [ ] Home
		- [ ] Portfolio/{id}
	- [ ] Components
		- [ ] Module
		- [ ] Form
		- [ ] Portfolio
		- [ ] Config