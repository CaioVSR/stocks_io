# Desafio Toro mobile

Aplicação flutter de exibição de ações em tempo real do desafio Toro mobile.

## Getting Started

Antes de iniciar o emulador faça os seguintes passos:

    1. Utilizar a versão 1.17.5 do flutter
    
    2. Após clonar ou baixar o repositório execute o comando `flutter packages get` dentro da pasta do projeto para baixar as dependências necessárias.
    
    3. Execute o comando `flutter pub run build_runner build --delete-conflicting-outputs` para gerar os arquivos .g dos controllers

    4. Rode a imagem docker fornecida para o desafio.
    
    5. No login utilize o usuário user@gmail.com e a senha 123456.
    
    6. Você pode a qualquer momento derrubar e reiniciar a conexão com o docker para testar o estado do websocket da aplicação.

O app foi desenvolvido utilizando o padrão MVC e o mobx para gestão de estado.
