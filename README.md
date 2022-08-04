# Cesta Solidária API

Esse guia tem por objetivo mostrar um dos diversos possíveis caminhos a serem tomados para disponibilizar a aplicação.

## Pré-requisitos

- Conta [Heroku](https://www.heroku.com/)
- Conta [MongoDB Atlas](https://www.mongodb.com/atlas/database)
- Conta no [Sendgrid](https://sendgrid.com/)
- [Node.js](https://nodejs.org/en/)
- [Git](https://git-scm.com/downloads)
- [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

## Configuração dos pré-requisitos

### MongoDB Atlas

1.  Crie uma conta no [MongoDB Atlas](https://www.mongodb.com/cloud/atlas/register).
2.  Escolha um plano. Para este guia, utilizaremos o plano gratuito.
3.  Crie um Cluster compartilhado.
4.  Crie um nome de usuário e senha para acesso ao banco de dados.
5.  Configure o IP
    Existem algumas soluções para fixar um IP no heroku. Como todos os add-ons pagos ou com uso muito limitado, para fins práticos, tornaremos o banco acessível a qualquer endereço de IP. Em IP Address preencha o valor: 0.0.0.0/0
6.  Clique em finish and close e depois em go to database.
7.  Selecione a opção connect para conectar-se ao cluster.
8.  Selecione a opção connect to your application.
9.  Copie a string de conexão informada e reserve. Esse valor será adicionado às variáveis de ambiente do Heroku.

### Firebase

1. Configuração da conta
   1. Acesse o console do [Firebase](https://console.firebase.google.com/?hl=pt-br).
   2. Crie um projeto e atribua um nome, não ative o google Analytics.
2. Configuração das credenciais
   1. Navegue até configurações de projeto.
   2. Contas de serviço, gere uma nova chave privada. O download do arquivo será feito.
   3. Renomeie esse arquivo para firebase_key.json e adicione à raiz do projeto.
3. Configuração do Storage
   1. No menu criação, navegue até Storage.
   2. Ative do serviço.
   3. Copie o endereço do bucket e reserve. O valor será adicionado às variáveis de ambiente do Heroku.
   4. Em regras, adicione o seguinte código

```
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
      match /users/{allPaths=**} {
        allow read;
        allow write: if request.auth != null;
    }

    match /comprovante_pessoa/{allPaths=**} {
        allow read;
        allow write: if request.auth != null;
    }
    match /comprovante_endereco/{allPaths=**} {
        allow read;
        allow write: if request.auth != null;
    }
    match /comprovante_renda/{allPaths=**} {
        allow read;
        allow write: if request.auth != null;
    }
    match /{allPaths=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

### Sendgrid

1. Faça o login na conta [Sendgrid](https://sendgrid.com/).
2. Navegue até Settings > Api Keys e clique em Create API Key.
3. Digite o nome da chave, nesse caso, CestaSolidaria.
4. Selecione Full Access nas opções de restrição.
5. Selecione Create and View.
6. Copie a chave informada e reserve para uso nas variáveis de ambiente do Heroku.

### Heroku

1. Crie uma conta no [Heroku](https://www.heroku.com/).
2. Com o Git já instalado e configurado, faça o clone deste repositório.
3. Instale o Heroku CLI no sistema operacional.
4. Na raiz do projeto, execute os seguintes comandos:
   1. Heroku login
   2. heroku create
   3. git push heroku main
5. Nesse ponto o deploy foi realizado. O aplicativo é criado pode ser acessado no [dashboard](https://dashboard.heroku.com/apps).
6. Selecione o aplicativo criado, e em seguida navegue até settings.
7. Acesse as variáveis de ambiente em reveal config vars.
8. Adicione as variáveis listadas na tabela a seguir.
   Variáveis de Ambiente

### Variáveis de ambiente

| Variável                  | Valor          | Descrição                                             |
| ------------------------- | -------------- | ----------------------------------------------------- |
| **DATABASE_ENV**          | **production** | Ambiente. Não modifique esse valor                    |
| **DATABASE**              |                | String de conexão do MongoDB Atlas                    |
| **DATABASE_PASSWORD**     |                | Senha deacesso ao banco de dados do MongoDB Atlas     |
| **DB_NAME**               | cesta_solidaria| Nome do banco a ser utilizado no MongoDB Atlas        |
| **JWT_SECRET**            |                | Json Web token HS256                                  |
| **JWT_EXPIRES_IN**        | 90d            | Tempo e vida do token de autenticação                 |
| **JWT_COOKIE_EXPIRES_IN** | 90             | Tempo de vida dos cookies                             |
| **SENDGRID_API_KEY**      |                | A chave da API do Sendgrid                            |
| **EMAIL_FROM**            |                | Email utilizado na assinatura dos emails da aplicação |
| **FIREBASE_BUCKET**       |                | Bucket do firebase Storage                            |
