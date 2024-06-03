***Settings***
Resource    ../resources/base.robot
Resource    ../Elements/Mesa/Mesa_Elements.robot


Test Setup     Abrir App
Test Teardown    Fechar App

Library    ../resources/libs/firebird.py



*** Test Cases ***

Login
    Setar senha padrão usuario
    Sleep    2s
    Clicar segundo usuario
    Minha senha    112233

Atualização de Dados
    Clicar segundo usuario
    Minha senha    112233
    Clicar Atualizacao


Venda simples papa fila   
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Venda papa fila sem reshop e sem VO    1    25717
    Ir para o pagamento
    Validar valor a pagar   9,00
    Pagamento com dinheiro papa fila


#teste novo formato
Venda Promocode (1 produto) papa fila [Cascão]   
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812    
    Venda papa fila Promocode (1 produto)        BF03079
    Ir para o pagamento
    Validar valor a pagar    5,10
    Pagamento com dinheiro papa fila       

Venda com 2 Promocodes
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812    
    Venda papa fila Promocode (1 produto)        BF03079
    Venda papa fila Promocode (1 produto)        BF03081
    Ir para o pagamento
    Validar valor a pagar    11,20
    Pagamento com dinheiro papa fila            

Venda Promocode (1 produto) papa fila [Sundae]   
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (1 produto)     BF03081
    Ir para o pagamento
    Validar valor a pagar    6,10
    Pagamento com dinheiro papa fila        

Venda Promocode papa fila [Bob's Max]   
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (1 produto)     BF03082
    Ir para o pagamento
    Validar valor a pagar    7,90
    Pagamento com dinheiro  

Venda Promocode papa fila [Batata Palito G]   
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (1 produto)     BF03083
    Ir para o pagamento
    Validar valor a pagar    10,90
    Pagamento com dinheiro papa fila         


Venda Promocode papa fila [Big Bob + Milk Shake 300ml]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03097
    Ir para o pagamento
    Validar valor a pagar    24,90
    Pagamento com dinheiro papa fila            

Venda Promocode papa fila [2 Casquinhas]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03080
    Ir para o pagamento
    Validar valor a pagar    5,50
    Pagamento com dinheiro papa fila   

Venda Promocode papa fila [2 Sundaes]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03084
    Ir para o pagamento
    Validar valor a pagar    10,90
    Pagamento com dinheiro papa fila  

Venda Promocode papa fila [Milk Shake 500 ml]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (1 produto)     BF03085
    Ir para o pagamento
    Validar valor a pagar    11,90
    Pagamento com dinheiro papa fila      

Venda Promocode papa fila [Cheddar Australiano + Refri]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03094
    Ir para o pagamento
    Validar valor a pagar    21,90
    Pagamento com dinheiro papa fila         

Venda Promocode papa fila [Cheeseburger + Refri Refil]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03086
    Ir para o pagamento
    Validar valor a pagar    13,50
    Pagamento com dinheiro papa fila   


Venda Promocode papa fila [Molho Big Bob]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (1 produto)     BF03087
    Ir para o pagamento
    Validar valor a pagar    14,50
    Pagamento com dinheiro papa fila 

Venda Promocode papa fila [Molho Burguer & Salad]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (1 produto)     BF03088
    Ir para o pagamento
    Validar valor a pagar    14,50
    Pagamento com dinheiro papa fila   

Venda Promocode papa fila [2 Milk Shakes 300ml]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03089
    Ir para o pagamento
    Validar valor a pagar    15,90
    Pagamento com dinheiro papa fila       

Venda Promocode papa fila (3 produtos)[Franlitos 6 + Batata Palito M + Refri]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03090
    Ir para o pagamento
    Validar valor a pagar    20,90
    Pagamento com dinheiro papa fila       

Venda Promocode papa fila [Big Bob + Refri]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03091
    Ir para o pagamento
    Validar valor a pagar    20,90
    Pagamento com dinheiro papa fila  

Venda Trio BOBS (1 Produto) [Trio Cheeseburger]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop           43433655812
    Venda papa fila Promocode TRIO Bobs (1 trio)     BF03092
    Ir para o pagamento
    Validar valor a pagar    20,90
    Pagamento com dinheiro papa fila   


Venda Trio BOBS (2 trios) [Trio Big Bob + Trio Chicken Crispy]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode TRIO Bobs (2 trio)        BF03107
    Ir para o pagamento
    Validar valor a pagar    43,90
    Pagamento com dinheiro papa fila  

Venda Promocode papa fila [Batata Palito M + Milk Shake 300ml]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03093
    Ir para o pagamento
    Validar valor a pagar    21,90
    Pagamento com dinheiro papa fila    

Venda Promocode papa fila [Cheddar Australiano + Refri]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03094
    Ir para o pagamento
    Validar valor a pagar    21,90
    Pagamento com dinheiro papa fila    

Venda Promocode papa fila [Batata Palito M + Milk Shake 500ml]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03095
    Ir para o pagamento
    Validar valor a pagar    22,90
    Pagamento com dinheiro papa fila    

Venda Promocode papa fila [Double Cheese + Milk Shake 300ml]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03096
    Ir para o pagamento
    Validar valor a pagar    23,50
    Pagamento com dinheiro papa fila         


Venda Promocode papafila [Big Bob + Milk Shake 300ml]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (2 produto)     BF03097
    Ir para o pagamento
    Validar valor a pagar    24,90
    Pagamento com dinheiro papa fila    
  

Venda Trio BOBS (1 Produto) [Trio Double Cheese]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode TRIO Bobs (1 trio)        BF03098
    Ir para o pagamento
    Validar valor a pagar    24,90
    Pagamento com dinheiro papa fila  


Venda Trio BOBS (1 Produto) [Trio Big Bob Frango]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop            43433655812
    Venda papa fila Promocode TRIO Bobs (1 trio)      BF03099
    Ir para o pagamento
    Validar valor a pagar    26,90
    Pagamento com dinheiro papa fila  

Venda Trio BOBS (1 Produto) [Trio Big Bob Veggie]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop           43433655812
    Venda papa fila Promocode TRIO Bobs (1 trio)     BF03100
    Ir para o pagamento
    Validar valor a pagar    27,50
    Pagamento com dinheiro papa fila      

Venda Trio BOBS (1 Produto) [Trio Big Bob]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode TRIO Bobs (1 trio)        BF03101
    Ir para o pagamento
    Validar valor a pagar    27,50
    Pagamento com dinheiro papa fila   

Venda Promocode papa fila [Big Bob + Refri + Sundae]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop    43433655812
    Venda papa fila Promocode (3 produto)     BF03102
    Ir para o pagamento
    Validar valor a pagar    27,90
    Pagamento com dinheiro papa fila   

Venda Promocode papa fila [Trio Cheddar Australiano]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop          43433655812
    Venda papa fila Promocode TRIO Bobs (1 trio)    BF03104
    Ir para o pagamento
    Validar valor a pagar    29,50
    Pagamento com dinheiro papa fila         

#não localizado promocode no reshop
Venda Promocode papa fila [Trio Tentador Veggie Carne]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop          43433655812
    Venda papa fila Promocode TRIO Bobs (1 trio)    BF03105
    Ir para o pagamento
    Validar valor a pagar    32,90
    Pagamento com dinheiro papa fila       

Venda Promocode papa fila [Trio Big Bob + Sundae]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop                      43433655812
    Venda papa fila Promocode TRIO Bobs (1 trio + 1 produto)    BF03106
    Ir para o pagamento
    Validar valor a pagar    35,90
    Pagamento com dinheiro papa fila 

Venda Promocode papa fila [Trio Big Bob + Trio Chicken Crispy]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop           43433655812
    Venda papa fila Promocode TRIO Bobs (2 trio)     BF03107
    Ir para o pagamento
    Validar valor a pagar    43,90
    Pagamento com dinheiro papa fila 

Venda Promocode papa fila [2 Trio Cheddar Australiano]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop           43433655812
    Venda papa fila Promocode TRIO Bobs (2 trio)     BF03108
    Ir para o pagamento
    Validar valor a pagar    52,90
    Pagamento com dinheiro papa fila     

Venda Promocode papa fila [Trio Big Bob + Trio Cheddar Australiano]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop           43433655812
    Venda papa fila Promocode TRIO Bobs (2 trio)     BF03109
    Ir para o pagamento
    Validar valor a pagar    54,90
    Pagamento com dinheiro papa fila      

Venda Promocode papa fila [2 Trios Big Bob]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop           43433655812
    Venda papa fila Promocode TRIO Bobs (2 trio)     BF03110
    Ir para o pagamento
    Validar valor a pagar    54,90
    Pagamento com dinheiro papa fila  

Venda Promocode papa fila [2 Trios Big Bob + 2 Bobs Max]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop                       43433655812
    Venda papa fila Promocode TRIO Bobs (2 trio + 2 produto)     BF03111
    Ir para o pagamento
    Validar valor a pagar    69,90
    Pagamento com dinheiro papa fila   


Venda Promocode papa fila [Trio Big Bob + Trio Cheddar Australiano + 2 Sundaes]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop                       43433655812
    Venda papa fila Promocode TRIO Bobs (2 trio + 2 produto)     BF03112
    Ir para o pagamento
    Validar valor a pagar    70,90
    Pagamento com dinheiro papa fila         


Venda Promocode papa fila [3 Trios Big Bob]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop           43433655812
    Venda papa fila Promocode TRIO Bobs (3 trio)     BF03113
    Ir para o pagamento
    Validar valor a pagar    82,90
    Pagamento com dinheiro papa fila    

Venda Promocode papa fila [3 Trio Cheddar Australiano]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop           43433655812
    Venda papa fila Promocode TRIO Bobs (3 trio)     BF03114
    Ir para o pagamento
    Validar valor a pagar    82,90
    Pagamento com dinheiro papa fila 

Venda Promocode papa fila [2 Trios Bob's Costela + 2 Sundaes]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop                       43433655812
    Venda papa fila Promocode TRIO Bobs (2 trio + 2 produto)     BF03115
    Ir para o pagamento
    Validar valor a pagar    89,90
    Pagamento com dinheiro papa fila 

Venda Promocode papa fila [Trio Bob's Premium com 15% de desconto]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop              43433655812
    Venda papa fila Promocode Desconto em % (1 trio)    BF03039
    Ir para o pagamento
    Validar desconto em % e Ir para o pagamento (15%)    
    Pagamento com dinheiro papa fila           

Venda Promocode papa fila [Trio Tentador Carne com 20% de desconto]
    Clicar segundo usuario
    Minha senha    112233
    Acessar papa fila
    Iniciar Venda Papa Fila Com CPF reshop               43433655812
    Venda papa fila Promocode Desconto em % (1 trio)     BF03040
    Ir para o pagamento
    Validar desconto em % e Ir para o pagamento (20%)   
    Pagamento com dinheiro papa fila        