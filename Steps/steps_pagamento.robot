*** Settings ***
Documentation    Aqui ficará todas as ações que realizaremos na parte do pagamento, serve para Mesa e Papa Fila
Library    AppiumLibrary
Library    String
Resource    ../resources/base.robot
Resource    ../Elements/Mesa/Mesa_Elements.robot


*** Keywords ***

Pagamento total mesa
    [Arguments]    ${NUM_MESA}
    Wait Until Element Is Visible    ${TXT_NUM MESA}    20
    Input Text    ${TXT_NUM MESA}    ${NUM_MESA}
    Sleep    1s
    Click Element    ${BTN_FINALIZAR MESA}
    Sleep    2s
    Click Element    ${BTN_PGTO TOTAL MESA}
    Wait Until Element Is Visible    ${CPF_NOTA FISCAL}    30
    #momento de por o cpf na nota
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_FINALIZAR}    30

Pagamento com dinheiro
    Wait Until Element Is Visible    ${BTN_ADICIONAR PGTO}    20
    Click Element    ${BTN_ADICIONAR PGTO} 
    Sleep    2s
    #Click Text    DINHEIRO

    ${xpath} =    Set Variable    //*[contains(@text, 'DINHEIRO')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    3s
        Swipe    500    1500    500    500  # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}
    
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    #se não aparecer a mensagem de sucesso signifgica q não finalizou a venda
    Wait Until Element Is Visible    ${MSG_PGTO SUCESSO}    40
    Click Element    ${BTN_CONFIRMAR}


Pagamento multiplos com dinheiro
    Wait Until Element Is Visible    ${BTN_ADICIONAR PGTO}    20
    Click Element    ${BTN_ADICIONAR PGTO} 
    Sleep    2s
    #Click Text    DINHEIRO

    ${xpath} =    Set Variable    //*[contains(@text, 'DINHEIRO')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    3s
        Swipe    500    1500    500    500  # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}
    Sleep    2s
    Clear Text    ${VALOR_PAGAMENTO}
    Sleep    1s
    Input Text    ${VALOR_PAGAMENTO}    0,10
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}

    # segunda rodada pgto
    Wait Until Element Is Visible    ${BTN_ADICIONAR PGTO}    20
    Click Element    ${BTN_ADICIONAR PGTO} 
    Sleep    2s
    #Click Text    DINHEIRO

    ${xpath} =    Set Variable    //*[contains(@text, 'DINHEIRO')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    3s
        Swipe    500    1500    500    500  # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}
    Sleep    2s
    Clear Text    ${VALOR_PAGAMENTO}
    Sleep    1s
    Input Text    ${VALOR_PAGAMENTO}    0,10
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    

    #terceira rodada e pagamento do restante
    Wait Until Element Is Visible    ${BTN_ADICIONAR PGTO}    20
    Click Element    ${BTN_ADICIONAR PGTO} 
    Sleep    2s
    #Click Text    DINHEIRO

    ${xpath} =    Set Variable    //*[contains(@text, 'DINHEIRO')]

    FOR    ${i}    IN RANGE    10    # Tentar rolar até o elemento até 10 vezes (ajuste conforme necessário)
        # Tentar encontrar o elemento
        ${elemento_existente} =    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Sair do loop se o elemento existir
        Run Keyword If    ${elemento_existente}    Exit For Loop

        # Rolar a tela para baixo usando coordenadas
        Sleep    3s
        Swipe    500    1500    500    500  # Ajuste as coordenadas conforme necessário
    END
    # Clicar no elemento encontrado
    Click Element    ${xpath}
    
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    #se não aparecer a mensagem de sucesso signifgica q não finalizou a venda
    Wait Until Element Is Visible    ${MSG_PGTO SUCESSO}    40
    Click Element    ${BTN_CONFIRMAR}
    

Pagamento em cartão
    Wait Until Element Is Visible    ${BTN_ADICIONAR PGTO}    20
    Click Element    ${BTN_ADICIONAR PGTO} 
    Sleep    2s
    Click Element    ${FINALIZADOR_CARTAO}
    Wait Until Element Is Visible    ${FINALIZADOR_CARTAO}    5
    Click Element    ${FINALIZADOR_CARTAO}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_SUCESSO CIELO}    10
    Click Element    ${BTN_SUCESSO CIELO} 
    #se não aparecer a mensagem de sucesso signifgica q não finalizou a venda
    Wait Until Element Is Visible    ${MSG_PGTO SUCESSO}    40
    Click Element    ${BTN_CONFIRMAR}    


Validar desconto em % e Ir para o pagamento (15%)    
    Wait Until Element Is Visible    ${VALOR_APAGAR}    30s

    # Obter o valor do elemento text ${VALOR_SUBTOTAL}
    ${subtotal} =    Get Text    ${VALOR_SUBTOTAL}

    # Converter o valor obtido em um número decimal
    ${subtotal} =    Convert To Number    ${subtotal}

    # Calcular o valor com desconto de 15%
    ${valor_com_desconto} =    Evaluate    ${subtotal} * 0.85  # 85% do valor original (100% - 15%)

    # Obter o valor do elemento text ${VALOR_APAGAR}
    ${valor_a_pagar} =    Get Text    ${VALOR_APAGAR}

    # Converter o valor obtido em um número decimal
    ${valor_a_pagar} =    Convert To Number    ${valor_a_pagar}
    Sleep    2s
    # Verificar se o valor a pagar é igual ao valor calculado com desconto
    Should Be Equal As Numbers    ${valor_a_pagar}    ${valor_com_desconto}

Validar desconto em % e Ir para o pagamento (20%)    
    Wait Until Element Is Visible    ${VALOR_APAGAR}    30s

    # Obter o valor do elemento text ${VALOR_SUBTOTAL}
    ${subtotal} =    Get Text    ${VALOR_SUBTOTAL}

    # Converter o valor obtido em um número decimal
    ${subtotal} =    Convert To Number    ${subtotal}

    # Calcular o valor com desconto de 15%
    ${valor_com_desconto} =    Evaluate    ${subtotal} * 0.80  # 80% do valor original (100% - 20%)

    # Obter o valor do elemento text ${VALOR_APAGAR}
    ${valor_a_pagar} =    Get Text    ${VALOR_APAGAR}

    # Converter o valor obtido em um número decimal
    ${valor_a_pagar} =    Convert To Number    ${valor_a_pagar}
    Sleep    2s
    # Verificar se o valor a pagar é igual ao valor calculado com desconto    






Pagamento com dinheiro papa fila
    Sleep    2s
    Wait Until Element Is Visible    ${BTN_ADICIONAR PGTO}    20
    Click Element    ${BTN_ADICIONAR PGTO} 
    Sleep    2s
    #Click Text    DINHEIRO

    ${xpath} =    Set Variable    //*[contains(@text, 'DINHEIRO')]

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
    
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    #se não aparecer a mensagem de sucesso signifgica q não finalizou a venda
    Sleep    8s
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    40
    Click Element    ${BTN_CONFIRMAR}

Validar valor a pagar 
    [Arguments]    ${valor}
    Sleep    2s
    Wait Until Element Is Visible    ${VALOR_APAGAR}    30s
    Sleep    4s
    Element Text Should Be    ${VALOR_APAGAR}     ${valor}   


