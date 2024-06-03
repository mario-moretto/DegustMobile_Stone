*** Settings ***
Documentation    Aqui ficará todas as ações que realizaremos no módulo papa fila
Library    AppiumLibrary
Library    String
#Library    XML
Resource    ../resources/base.robot
Resource    ../Elements/Mesa/Mesa_Elements.robot



*** Keywords ***

Acessar papa fila 
    Wait Until Element Is Visible    ${BTN_PAPA FILA}    90
    Click Element    ${BTN_PAPA FILA}


Venda papa fila sem reshop e sem VO
    [Arguments]   ${QTD}    ${COD_PROD}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    30
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20
    Click Element                    ${TXT_PESQUISA PROD}
    Sleep    1s
    Input Text                       ${TXT_PESQUISA PROD}    ${COD_PROD}
    Sleep    2s
    Click Element                    ${BTN_TXT PESQUISA PROD}        
    Wait Until Element Is Visible    ${TXT_PROD QTD}      10
    Clear Text                       ${TXT_PROD QTD} 
    Sleep    2s
    Input Text                       ${TXT_PROD QTD}      ${QTD}
    Sleep    1s
    Click Element                    ${BTN_CONFIRMAR} 

Lançar produto por codigo
    [Arguments]       ${COD_PROD}
    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20
    Click Element                    ${TXT_PESQUISA PROD}
    Sleep    1s
    Input Text                       ${TXT_PESQUISA PROD}    ${COD_PROD}
    Sleep    2s
    Click Element                    ${BTN_TXT PESQUISA PROD}        
    Wait Until Element Is Visible    ${TXT_PROD QTD}      10
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    #--------ESSA LOGICA É PARA SE TER PRODUTO ADICIONAL OU NÃO A VENDA PROSSEGUIR--------------------------------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${confirmar_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PROD QTD}    10s
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONFIRMAR}
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${confirmar_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PROD QTD}    10s
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONFIRMAR}
    

Iniciar Venda Papa Fila Com CPF reshop
    [Arguments]      ${CPF}    
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    30
    Click Element    ${BTN_CONFIRMAR}
    Sleep    3s
    Wait Until Element Is Visible    ${CPF RESHOP}       50 
    Input Text       ${CPF RESHOP}     ${CPF}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    30
    Click Element    ${BTN_CONFIRMAR}
    #Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Wait Until Page Contains    Reshop     30
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_OK ANDROID}    20
    Click Element    ${BTN_OK ANDROID} 


Venda papa fila Promocode (1 produto)
    [Arguments]         ${promocode}
    Sleep    3s
    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20
    Click Text    	Reshop (PROMOCODE)

    Wait Until Element Is Visible    ${TXT_PROMOCODE}    10
    Input Text       ${TXT_PROMOCODE}    ${promocode}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_OK ANDROID}    20
    Click Element    ${BTN_OK ANDROID} 
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    #--------ESSA LOGICA É PARA SE TER PRODUTO ADICIONAL OU NÃO A VENDA PROSSEGUIR--------------------------------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${confirmar_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PROD QTD}    10s
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONFIRMAR}



    

Ir para o pagamento
    Wait Until Element Is Visible    ${BTN_CONCLUIR}    20
    Click Element    ${BTN_CONCLUIR}
    Wait Until Page Contains Element    ${BTN_CONCLUIR}    30
    Click Element    ${BTN_CONCLUIR}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}



Venda papa fila Promocode (2 produto)
    [Arguments]         ${promocode}
    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20
    Click Text    	Reshop (PROMOCODE)

    Wait Until Element Is Visible    ${TXT_PROMOCODE}    10
    Input Text       ${TXT_PROMOCODE}    ${promocode}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_OK ANDROID}    20
    Click Element    ${BTN_OK ANDROID} 
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    #--------ESSA LOGICA É PARA SE TER PRODUTO ADICIONAL OU NÃO A VENDA PROSSEGUIR--------------------------------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${confirmar_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PROD QTD}    10s
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONFIRMAR}
    #Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Wait Until Element Is Visible    ${BTN_CONCLUIR}    10s
    #Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONCLUIR}

    #-------------------------------------------------------------------------------------------------------------

        #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    #--------ESSA LOGICA É PARA SE TER PRODUTO ADICIONAL OU NÃO A VENDA PROSSEGUIR--------------------------------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${confirmar_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PROD QTD}    10s
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONFIRMAR}
    



Venda papa fila Promocode (3 produto)
    [Arguments]         ${promocode}
    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20
    Click Text    	Reshop (PROMOCODE)

    Wait Until Element Is Visible    ${TXT_PROMOCODE}    10
    Input Text       ${TXT_PROMOCODE}    ${promocode}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_OK ANDROID}    20
    Click Element    ${BTN_OK ANDROID} 
    #(1° PRODUTO)--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    #--------ESSA LOGICA É PARA SE TER PRODUTO ADICIONAL OU NÃO A VENDA PROSSEGUIR--------------------------------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${confirmar_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PROD QTD}    10s
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONFIRMAR}
    #Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Wait Until Element Is Visible    ${BTN_CONCLUIR}    10s
    #Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONCLUIR}

    #-------------------------------------------------------------------------------------------------------------

    #(2° PRODUTO)--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    #--------ESSA LOGICA É PARA SE TER PRODUTO ADICIONAL OU NÃO A VENDA PROSSEGUIR--------------------------------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${confirmar_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PROD QTD}    10s
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONFIRMAR}
    #Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Wait Until Element Is Visible    ${BTN_CONCLUIR}    10s
    #Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONCLUIR}

    #-------------------------------------------------------------------------------------------------------------

    #(3° PRODUTO)--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    #--------ESSA LOGICA É PARA SE TER PRODUTO ADICIONAL OU NÃO A VENDA PROSSEGUIR--------------------------------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${confirmar_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PROD QTD}    10s
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONFIRMAR}




Venda papa fila Promocode (1 ou 2 produto)
    [Arguments]         ${promocode}
    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20
    Click Text    	Reshop (PROMOCODE)

    Wait Until Element Is Visible    ${TXT_PROMOCODE}    10
    Input Text       ${TXT_PROMOCODE}    ${promocode}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_OK ANDROID}    20
    Click Element    ${BTN_OK ANDROID} 
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    #--------ESSA LOGICA É PARA SE TER PRODUTO ADICIONAL OU NÃO A VENDA PROSSEGUIR--------------------------------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${confirmar_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PROD QTD}    10s
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONFIRMAR}
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Wait Until Element Is Visible    ${BTN_CONCLUIR}    10s
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONCLUIR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${confirmar_visible}    Wait Until Element Is Visible    ${BTN_CONCLUIR}    10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${confirmar_visible}    Click Element    ${BTN_CONCLUIR}
    #-------------------------------------------------------------------------------------------------------------
    
    
    #-------VER SE HÁ OUTRO PRODUTO PARA LANÇAR E LANÇA-LO------------------------------------
    # Verificar se o elemento TOPO_ITEM_2 está visível
    ${topo_item_2_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TOPO_ITEM_2}    20s

    # Executar o código apenas se o elemento TOPO_ITEM_2 for visível
    Run Keyword If    '${topo_item_2_visible}' == 'True'    Click Element    ${PRODUTO_1X1} 
        #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
        # Tentar clicar no botão Confirmar e continuar em caso de falha
        ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
        Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
        Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
        Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

        # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
        Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
        Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
        #-------------------------------------------------------------------------------------------------------------    

        #--------ESSA LOGICA É PARA SE TER PRODUTO ADICIONAL OU NÃO A VENDA PROSSEGUIR--------------------------------
        # Tentar clicar no botão Confirmar e continuar em caso de falha
        ${confirmar_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PROD QTD}    10s
        Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONFIRMAR}



Venda papa fila Promocode TRIO Bobs (1 trio)
    [Arguments]         ${promocode}
    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20
    Click Text    	Reshop (PROMOCODE)

    Wait Until Element Is Visible    ${TXT_PROMOCODE}    10
    Input Text       ${TXT_PROMOCODE}    ${promocode}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_OK ANDROID}    20
    Click Element    ${BTN_OK ANDROID} 
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    # Construir o XPath para elementos que contenham "Acp Franlitos 12 Unid" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Acp Batata Palito M Cb Rsp')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    3s
        Swipe    328    925    332    769  # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}

    # Construir o XPath para elementos que contenham "Refri Refil Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}   

    # Construir o XPath para elementos que contenham "Refri Refil Coca Trad Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Coca Trad Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}  



Venda papa fila Promocode TRIO Bobs (2 trio)
    [Arguments]         ${promocode}
    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20
    Click Text    	Reshop (PROMOCODE)

    Wait Until Element Is Visible    ${TXT_PROMOCODE}    10
    Input Text       ${TXT_PROMOCODE}    ${promocode}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_OK ANDROID}    20
    Click Element    ${BTN_OK ANDROID} 
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    # Construir o XPath para elementos que contenham "Acp Franlitos 12 Unid" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Acp Batata Palito M Cb Rsp')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    3s
        Swipe    328    925    332    769  # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}

    # Construir o XPath para elementos que contenham "Refri Refil Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}   

    # Construir o XPath para elementos que contenham "Refri Refil Coca Trad Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Coca Trad Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}  

    #### SEGUNDO PRODUTO DO TRIO ########
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    # Construir o XPath para elementos que contenham "Acp Franlitos 12 Unid" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Acp Batata Palito M Cb Rsp')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    1s
        Swipe    328    925    332    769  # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}

    # Construir o XPath para elementos que contenham "Refri Refil Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}   

    # Construir o XPath para elementos que contenham "Refri Refil Coca Trad Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Coca Trad Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}  



Venda papa fila Promocode TRIO Bobs (3 trio)
    [Arguments]         ${promocode}
    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20
    Click Text    	Reshop (PROMOCODE)

    Wait Until Element Is Visible    ${TXT_PROMOCODE}    10
    Input Text       ${TXT_PROMOCODE}    ${promocode}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_OK ANDROID}    20
    Click Element    ${BTN_OK ANDROID} 
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    # Construir o XPath para elementos que contenham "Acp Franlitos 12 Unid" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Acp Batata Palito M Cb Rsp')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    3s
        Swipe    328    925    332    769   # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}

    # Construir o XPath para elementos que contenham "Refri Refil Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}   

    # Construir o XPath para elementos que contenham "Refri Refil Coca Trad Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Coca Trad Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}  

    #### SEGUNDO PRODUTO DO TRIO ########
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    # Construir o XPath para elementos que contenham "Acp Franlitos 12 Unid" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Acp Batata Palito M Cb Rsp')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    1s
        Swipe    328    925    332    769  # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}

    # Construir o XPath para elementos que contenham "Refri Refil Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}   

    # Construir o XPath para elementos que contenham "Refri Refil Coca Trad Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Coca Trad Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}  
    
    #### TERCEIRO PRODUTO DO TRIO ########
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    # Construir o XPath para elementos que contenham "Acp Franlitos 12 Unid" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Acp Batata Palito M Cb Rsp')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    1s
        Swipe    328    925    332    769  # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}

    # Construir o XPath para elementos que contenham "Refri Refil Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}   

    # Construir o XPath para elementos que contenham "Refri Refil Coca Trad Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Coca Trad Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}




Venda papa fila Promocode TRIO Bobs (2 trio + 2 produto)
    [Arguments]         ${promocode}
    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20
    Click Text    	Reshop (PROMOCODE)

    Wait Until Element Is Visible    ${TXT_PROMOCODE}    10
    Input Text       ${TXT_PROMOCODE}    ${promocode}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_OK ANDROID}    20
    Click Element    ${BTN_OK ANDROID} 
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    # Construir o XPath para elementos que contenham "Acp Franlitos 12 Unid" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Acp Batata Palito M Cb Rsp')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    3s
        Swipe    328    925    332    769  # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}

    # Construir o XPath para elementos que contenham "Refri Refil Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}   

    # Construir o XPath para elementos que contenham "Refri Refil Coca Trad Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Coca Trad Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}  

    #### SEGUNDO PRODUTO DO TRIO ########
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    # Construir o XPath para elementos que contenham "Acp Franlitos 12 Unid" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Acp Batata Palito M Cb Rsp')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    1s
        Swipe    328    925    332    769  # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}

    # Construir o XPath para elementos que contenham "Refri Refil Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}   

    # Construir o XPath para elementos que contenham "Refri Refil Coca Trad Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Coca Trad Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}  

    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    #--------ESSA LOGICA É PARA SE TER PRODUTO ADICIONAL OU NÃO A VENDA PROSSEGUIR--------------------------------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${confirmar_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PROD QTD}    10s
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONFIRMAR}
    #Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Wait Until Element Is Visible    ${BTN_CONCLUIR}    10s
    #Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONCLUIR}

    #-------------------------------------------------------------------------------------------------------------

        #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    #--------ESSA LOGICA É PARA SE TER PRODUTO ADICIONAL OU NÃO A VENDA PROSSEGUIR--------------------------------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${confirmar_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PROD QTD}    10s
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONFIRMAR}




Venda papa fila Promocode TRIO Bobs (1 trio + 1 produto)
    [Arguments]         ${promocode}
    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20
    Click Text    	Reshop (PROMOCODE)

    Wait Until Element Is Visible    ${TXT_PROMOCODE}    10
    Input Text       ${TXT_PROMOCODE}    ${promocode}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_OK ANDROID}    20
    Click Element    ${BTN_OK ANDROID} 
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    # Construir o XPath para elementos que contenham "Acp Franlitos 12 Unid" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Acp Batata Palito M Cb Rsp')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    3s
        Swipe    328    925    332    769  # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}

    # Construir o XPath para elementos que contenham "Refri Refil Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}   

    # Construir o XPath para elementos que contenham "Refri Refil Coca Trad Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Coca Trad Cb Rsp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}  

    #### SEGUNDO PRODUTO ########
    #(2° PRODUTO)--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    #--------ESSA LOGICA É PARA SE TER PRODUTO ADICIONAL OU NÃO A VENDA PROSSEGUIR--------------------------------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${confirmar_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PROD QTD}    10s
    Run Keyword And Continue On Failure    Run Keyword If    ${confirmar_visible}    Click Element    ${BTN_CONFIRMAR}

    


Lançar acompanhamentos acp batata canoa
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20
    # Construir o XPath para elementos que contenham "Acompanhamentos" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Acompanhamentos')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}

 # Construir o XPath para elementos que contenham "Acp Franlitos 12 Unid" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Acp Franlitos 12 Unid')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Swipe    328    925    332    769   # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}

    Sleep    1s
    Click Element                    ${BTN_CONFIRMAR} 
    Wait Until Element Is Visible    ${BTN_CONCLUIR}      10
    Click Element                    ${BTN_CONCLUIR} 
    Wait Until Element Is Visible    ${BTN_CONCLUIR}      40
    Click Element                    ${BTN_CONCLUIR} 
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}     20
    Click Element                    ${BTN_CONFIRMAR}



Venda papa fila Promocode Desconto em % (1 trio)
    [Arguments]         ${promocode}
    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20
    Click Text    	Reshop (PROMOCODE)

    Wait Until Element Is Visible    ${TXT_PROMOCODE}    10
    Input Text       ${TXT_PROMOCODE}    ${promocode}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_OK ANDROID}    20
    Click Element    ${BTN_OK ANDROID} 
    #--------VERIFICAR SE HÁ PRODUTO PARA ESCOLHER OU É SÓ UMA OPÇÃO------
    # Tentar clicar no botão Confirmar e continuar em caso de falha
    ${PRODUTO_visible} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${TXT_PESQUISA PROD}    20s
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${PRODUTO_1X1}
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    10 
    Run Keyword And Continue On Failure    Run Keyword If    ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}

    # Tentar clicar no botão Concluir apenas se o botão Confirmar não foi clicado
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Wait Until Element Is Visible    ${BTN_CONFIRMAR}   10s
    Run Keyword And Continue On Failure    Run Keyword If    not ${PRODUTO_visible}    Click Element    ${BTN_CONFIRMAR}
    #-------------------------------------------------------------------------------------------------------------    

    # Construir o XPath para elementos que contenham "Acp Franlitos 12 Unid" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Acp Batata Palito Med Camp')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    3s
        Swipe    328    925    332    769  # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}

    # Construir o XPath para elementos que contenham "Refri Refil Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Camp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}   

    # Construir o XPath para elementos que contenham "Refri Refil Coca Trad Cb Rsp" no atributo 'text'
    ${xpath} =    Set Variable    //*[contains(@text, 'Refri Refil Coca Trad Camp')]
    # Esperar até que um elemento correspondente seja visível na tela
    Wait Until Element Is Visible    ${xpath}    timeout=30s
    # Clicar no elemento encontrado
    Click Element    ${xpath}  
    # seguir sem adicional
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}    

    Wait Until Element Is Visible    ${BTN_CONCLUIR}    20
    Click Element    ${BTN_CONCLUIR}
    Wait Until Element Is Visible    ${BTN_CONCLUIR}    20
    Click Element    ${BTN_CONCLUIR}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}

    
