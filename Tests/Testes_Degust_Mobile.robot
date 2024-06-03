***Settings***
Resource    ../resources/base.robot
#Resource    ../resources/base.robot
Resource    ../Elements/Mesa/Mesa_Elements.robot

Test Setup     Abrir App
Test Teardown    Fechar App


*** Test Cases ***

Login
    Clicar segundo usuario
    Minha senha    112233

Atualização de Dados
    Clicar segundo usuario
    Minha senha    112233
    Clicar Atualizacao

Lançamento produtos na mesa
    Clicar segundo usuario
    Minha senha    112233
    Acessar Venda mesa
    Digitar nova mesa e Acessar    2
    Digitar area mesa com reshop    43433655812
    Lancar produtos mesa sem V.O.   5    64331

Acessar mesa aberta, Lançar novamente e Fechar
    Clicar segundo usuario
    Minha senha    112233
  # Clicar Atualizacao
    Acessar Venda mesa
    Acessar mesa ja aberta com reshop  2
    Lancar produtos mesa sem V.O.    2    10201
    Fechar mesa sem taxa    2    112233
    Pagamento total mesa    2
    Pagamento em cartão    


Venda simples papa fila   
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Venda papa fila sem reshop e sem VO    1    25717
    Ir para o pagamento
    Validar valor a pagar    9,00
    Pagamento com dinheiro papa fila

Venda simples papa fila (multiplos pgto dinheiro) 
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Venda papa fila sem reshop e sem VO    1    25717
    Ir para o pagamento
    Validar valor a pagar    9,00
    Pagamento multiplos com dinheiro


Venda Promocode (1 produto) papa fila   
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (1 produto)     BF03079
    Ir para o pagamento
    Validar valor a pagar    5.10
    Pagamento com dinheiro papa fila    


Venda mesa sem reshop com pgto parcial
    Clicar segundo usuario
    Minha senha    112233
    Acessar Venda mesa
    Digitar nova mesa e Acessar    50
    Digitar area mesa Sem reshop
    Lancar produtos mesa sem V.O.    3    10201
    Fechamento parcial - 1 item - com taxa    50
    Pagamento com dinheiro
    Fechamento parcial - 1 item - com taxa    50
    Pagamento com dinheiro
    Fechamento parcial - 1 item - com taxa    50
    Pagamento com dinheiro
    Validação para verificar se mesa foi fechada    50

Venda mesa por cod produto
    Clicar segundo usuario
    Minha senha    112233
    Acessar Venda mesa
    Digitar nova mesa e Acessar    10
    Digitar area mesa com reshop    43433655812
    Lançar produto por codigo    70138
    Concluir lançamento mesa
    Fechar mesa com taxa    10
    Validar valor a pagar    21,89
    Pagamento com dinheiro papa fila   


Validação mesa fechada
    Clicar segundo usuario
    Minha senha    112233
    Acessar Venda mesa
    Validação para verificar se mesa foi fechada    70


Venda mesa sem reshop com pgto parcial loop
    Clicar segundo usuario
    Minha senha    112233
    Acessar Venda mesa
    
    FOR    ${index}    IN RANGE    3
            Digitar nova mesa e Acessar    70
            Digitar area mesa Sem reshop
            Lancar produtos mesa sem V.O.    3    10201
            Fechamento parcial - 1 item - com taxa    70
            Pagamento com dinheiro
            Fechamento parcial - 1 item - com taxa    70
            Pagamento com dinheiro
            Fechamento parcial - 1 item - com taxa    70
            Pagamento com dinheiro
            Validação para verificar se mesa foi fechada    70
    END
    


Venda mesa Sem reshop pgto cartao
    Clicar segundo usuario
    Minha senha    112233
    Acessar Venda mesa
    Digitar nova mesa e Acessar    55
    Digitar area mesa Sem reshop
    Lancar produtos mesa sem V.O.    3    10201
    Fechar mesa sem taxa    55    112233
    Pagamento total mesa    55
    Pagamento em cartão 


Venda mesa Sem reshop pgto cartao Loop
    Clicar segundo usuario
    Minha senha    112233
    Acessar Venda mesa
    FOR    ${index}    IN RANGE    3
        Digitar nova mesa e Acessar    55
        Digitar area mesa Sem reshop
        Lancar produtos mesa sem V.O.    3    10201
        Fechar mesa sem taxa    55    112233
        Pagamento total mesa    55
        Pagamento em cartão 
    END    

Teste clicar elemento  
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Lançar acompanhamentos acp batata canoa




FOOD-30746 - MESA DUPLICADA MOB 
    Clicar segundo usuario
    Minha senha    112233
    Acessar Venda mesa
    FOR    ${index}    IN RANGE    3
        Digitar nova mesa e Acessar    5
        Digitar area mesa Sem reshop
        Lancar produtos mesa sem V.O.    3    10201
        Acessar mesa aberta sem reshop    5
        Lancar produtos mesa sem V.O.    3    10201
        Fechar mesa sem taxa    5    112233
        Pagamento total mesa    5
        Pagamento com dinheiro
    END  