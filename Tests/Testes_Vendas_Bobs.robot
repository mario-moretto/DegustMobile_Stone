***Settings***
Resource    ../resources/base.robot
Resource    ../Elements/Mesa/Mesa_Elements.robot


Test Setup     Abrir App
Test Teardown    Fechar App

Library    ../resources/libs/firebird.py



*** Test Cases ***


Testes diversas vendas
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812    
    Venda papa fila Promocode (1 produto)        BF03079
    Venda papa fila Promocode (1 produto)        BF03081
    Ir para o pagamento
    Validar valor a pagar    11,20
    Pagamento com dinheiro papa fila            
    #Venda Promocode (1 produto) papa fila [Sundae]   
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (1 produto)     BF03081
    Ir para o pagamento
    Validar valor a pagar    6,10
    Pagamento com dinheiro papa fila        
    #Venda Promocode papa fila [Bob's Max]   
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (1 produto)     BF03082
    Ir para o pagamento
    Validar valor a pagar    7,90
    Pagamento com dinheiro  
    #Venda Promocode papa fila [Batata Palito G]   
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (1 produto)     BF03083
    Ir para o pagamento
    Validar valor a pagar    10,90
    Pagamento com dinheiro papa fila         


FOOD-26769 - BOBS FÃ Mobile não lê promocode
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    #Venda Promocode papa fila [Batata Palito G]   
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (1 produto)     BF03083
    Venda papa fila Promocode (2 produto)     BF03095
    Venda papa fila Promocode (2 produto)     BF03090
    Ir para o pagamento
    Pagamento com dinheiro papa fila 


FOOD-27468 - Combinações de promocode aplica desconto incorreto no ultimo
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    #Venda Promocode papa fila [Batata Palito G]   
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (1 produto)     BF03083
    Ir para o pagamento
    Validar valor a pagar    10,90
    Pagamento com dinheiro papa fila  
    #[Batata Palito M + Milk Shake 500ml] 
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03095
    Ir para o pagamento
    Validar valor a pagar    22,90
    Pagamento com dinheiro papa fila  
    #[Franlitos 6 + Batata Palito M + Refri]
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03090
    Ir para o pagamento
    Validar valor a pagar    20,90
    Pagamento com dinheiro papa fila 

FOOD-25873 - Venda com 2 promocode + sanduiche causa problema na venda seguinte
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    FOR    ${index}    IN RANGE    3
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03097
    Venda papa fila Promocode TRIO Bobs (1 trio)        BF03098
    Lançar produto por codigo      50018
    Ir para o pagamento
    Validar valor a pagar    65,80
    Pagamento com dinheiro papa fila  
    END


FOOD-27338 Desconto incorreto promocode
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila 
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03097
    Venda papa fila Promocode TRIO Bobs (1 trio)        BF03098
    Lançar produto por codigo        50018
    Ir para o pagamento
    Validar valor a pagar    65,80
    Pagamento com dinheiro papa fila


Teste Venda simples papa fila por codigo 
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Lançar produto por codigo        50018
    Ir para o pagamento
    Validar valor a pagar    16,00
    Pagamento com dinheiro papa fila      


Venda promocode loop [Cascão]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    FOR    ${index}    IN RANGE    3
        Iniciar Venda Papa Fila Com CPF reshop    43433655812  
        Venda papa fila Promocode (1 produto)     BF03079
        Ir para o pagamento
        Validar valor a pagar    5,10
        Pagamento com dinheiro 
    END    

Venda promocode loop [Trio Big Bob Frango]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    FOR    ${index}    IN RANGE    3
        Sleep    3s
        Iniciar Venda Papa Fila Com CPF reshop            43433655812
        Venda papa fila Promocode TRIO Bobs (1 trio)      BF03099
        Ir para o pagamento
        Validar valor a pagar    26,90
        Pagamento com dinheiro papa fila  
    END            


Venda 3 promocode TRIO
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop          43433655812
    Venda papa fila Promocode TRIO Bobs (1 trio)    BF03104
    Venda papa fila Promocode TRIO Bobs (1 trio)    BF03099
    Venda papa fila Promocode TRIO Bobs (1 trio)    BF03098
    Ir para o pagamento
    Validar valor a pagar    81,30
    Pagamento com dinheiro papa fila      


Venda TESTE MASTER
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    FOR    ${index}    IN RANGE    3
        Iniciar Venda Papa Fila Com CPF reshop    43433655812  
        Venda papa fila Promocode (1 produto)     BF03079
        Ir para o pagamento
        Validar valor a pagar    5,10
        Pagamento com dinheiro 
    END
    FOR    ${index}    IN RANGE    3
        Sleep    3s
        Venda papa fila Promocode TRIO Bobs (1 trio)    BF03104
        Venda papa fila Promocode TRIO Bobs (1 trio)    BF03099
        Venda papa fila Promocode TRIO Bobs (1 trio)    BF03098
        Ir para o pagamento
        Validar valor a pagar    81,30
        Pagamento com dinheiro papa fila 
    END

    FOR    ${index}    IN RANGE    3
        Sleep    3s
        Iniciar Venda Papa Fila Com CPF reshop            43433655812
        Venda papa fila Promocode TRIO Bobs (1 trio)      BF03099
        Ir para o pagamento
        Validar valor a pagar    26,90
        Pagamento com dinheiro papa fila  
    END   
    FOR    ${index}    IN RANGE    3
        Sleep    3s
        Iniciar Venda Papa Fila Com CPF reshop            43433655812
        Venda papa fila Promocode TRIO Bobs (1 trio)      BF03099
        Ir para o pagamento
        Validar valor a pagar    26,90
        Pagamento com dinheiro papa fila  
    END