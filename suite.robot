***Settings***
Resource    resources/base.robot
Resource    resources/base.robot
Resource    Elements/Mesa/Mesa_Elements.robot

Test Setup     Abrir App
Test Teardown    Fechar App


*** Test Cases ***
Teste login + lançamento produtos mesa
    Clicar segundo usuario
    Minha senha    112233
  # Clicar Atualizacao
    Acessar Venda mesa
    Digitar nova mesa e Acessar    12
    Digitar area mesa com reshop    43433655812
    Lancar produtos mesa sem V.O.   5    64331


Acessar mesa lançar novamente e Fechar
    Clicar segundo usuario
    Minha senha    112233
  # Clicar Atualizacao
    Acessar Venda mesa
    Acessar mesa ja aberta com reshop  12
    Lancar produtos mesa sem V.O.    2    10201
    Fechar mesa sem taxa    12    112233
    Pagamento total mesa    12
    Pagamento com dinheiro


Abrir Papa fila    
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila




    
