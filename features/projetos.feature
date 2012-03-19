# language: pt
Funcionalidade: Gerenciar Projetos
  Permitir gerenciar projetos adicionando
  editando
  removendo
  fechando

  Cenário: Criando um projeto
    Dado que estou logado 
    E que estou na pagina "Novo Projeto"
    E informo o "projeto_nome" "qualquer"
    Quando eu clico em Criar Projeto
    Então o sistema informa que "projeto foi criado com sucesso"
    E salva o novo projeto com o usuario logado

#  Cenário: Editando um projeto

#    Dado que estou na pagina "Novo Projeto"
#    E informo o "projeto_nome" "qualquer"
#    Quando eu clico em "Criar Projeto"
#    Então o sistema informa que "projeto foi editado com sucesso"
