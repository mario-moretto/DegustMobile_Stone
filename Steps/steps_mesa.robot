*** Settings ***
Documentation    Aqui ficará todas as ações que realizaremos no módulo Venda Mesa
Library    AppiumLibrary
Library    String
Resource    ../resources/base.robot
Resource    ../Elements/Mesa/Mesa_Elements.robot


*** Keywords ***

Acessar Venda mesa
    Wait Until Element Is Visible    ${BTN_MENU_VENDA MESA 1}    20
    Click Element                    ${BTN_MENU_VENDA MESA 1}
    Wait Until Element Is Visible    ${BTN_MODULO MESA}          20    
    Click Element                    ${BTN_MODULO MESA}
    
Digitar nova mesa e Acessar  
    [Arguments]    ${Num_mesa}  
    Wait Until Element Is Visible    ${TXT_NUM MESA}    30
    Input Text                       ${TXT_NUM MESA}    ${Num_mesa} 
    Click Element                    ${BTN_CONFIRMAR MESA} 
    Wait Until Element Is Visible    ${BTN_SIM}         30
    Click Element                    ${BTN_SIM}   
    Wait Until Element Is Visible    ${AREA_MESA}       30

Acessar mesa ja aberta com reshop
    [Arguments]    ${NUM_MESA}
    #Wait Until Element Is Visible    id=br.com.efetiva.habibsmobilehomologlojas.activity:id/venda_mesa_numero_mesa_txtNumeroMesa    20
    Sleep    3s
    Input Text                        ${TXT_NUM MESA}    ${NUM_MESA}
    Sleep    2s
    Click Element                     ${BTN_CONFIRMAR MESA} 
    Wait Until Element Is Visible     ${BTN_RESGATE RESHOP}     40
    Click Element                     ${BTN_CONFIRMAR}
    Wait Until Element Is Visible     ${BTN_ITENS MESA}         30


Acessar mesa aberta sem reshop
    [Arguments]    ${NUM_MESA}
    Sleep    3s
    Input Text                        ${TXT_NUM MESA}    ${NUM_MESA}
    Sleep    2s
    Click Element                     ${BTN_CONFIRMAR MESA}     
    Wait Until Element Is Visible     ${BTN_ITENS MESA}         30

Digitar area mesa com reshop
    [Arguments]    ${CPF}  
    Input Text                        ${TXT_AREA MESA}        Mesa C Reshop
    Click Element                     ${BTN_CONFIRMAR} 
    Wait Until Element Is Visible     ${BTN_SIM}               30
    Click Element                     ${BTN_SIM} 
    Wait Until Element Is Visible     ${BTN_CONFIRMAR}         30
    Click Element                     ${BTN_CONFIRMAR} 
    # cpf reshop
    Wait Until Element Is Visible     ${CPF RESHOP}
    Input Text                        ${CPF RESHOP}    ${CPF}   
    Sleep    2s
    Click Element                     ${BTN_CONFIRMAR} 
    Wait Until Element Is Visible     ${BTN_RESGATE RESHOP}     40
    Click Element                     ${BTN_CONFIRMAR}
    Wait Until Element Is Visible     ${BTN_ITENS MESA}         30

Digitar area mesa Sem reshop
    Input Text                        ${TXT_AREA MESA}        Mesa S Reshop
    Click Element                     ${BTN_CONFIRMAR} 
    #Wait Until Page Contains          ${BTN_CONFIRMAR}         30
    Sleep    2s
    Click Element                     ${BTN_CONFIRMAR}  
    Sleep    2s
    Click Element                     ${BTN_CONFIRMAR}    
    Wait Until Element Is Visible     ${BTN_ITENS MESA}         30

Lancar produtos mesa sem V.O.
    [Arguments]   ${QTD}    ${COD_PROD}

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
    Wait Until Element Is Visible    ${BTN_CONCLUIR}      10
    Click Element                    ${BTN_CONCLUIR} 
    Wait Until Element Is Visible    ${BTN_CONCLUIR}      40
    Click Element                    ${BTN_CONCLUIR} 
    Wait Until Element Is Visible    ${BTN_OK PEDIDO}     30
    Click Element                    ${BTN_OK PEDIDO}
    Wait Until Element Is Visible    ${TXT_NUM MESA}      30
         
Concluir lançamento mesa
    Wait Until Element Is Visible    ${BTN_CONCLUIR}      10
    Click Element                    ${BTN_CONCLUIR} 
    Wait Until Element Is Visible    ${BTN_CONCLUIR}      40
    Click Element                    ${BTN_CONCLUIR} 
    Wait Until Element Is Visible    ${BTN_OK PEDIDO}     30
    Click Element                    ${BTN_OK PEDIDO}
    Wait Until Element Is Visible    ${TXT_NUM MESA}      30

Fechar mesa com taxa
        [Arguments]       ${NUM_MESA}
        Wait Until Element Is Visible       ${TXT_NUM MESA}       20
        Input Text        ${TXT_NUM MESA}   ${NUM_MESA}
        Click Element     ${BTN_FECHARMESA}
        Wait Until Element Is Visible       ${BTN_CONFIRMAR}      50
        Click Element     ${BTN_CONFIRMAR} 
        Wait Until Element Is Visible    ${BTN_SIM TX SERVIÇO}    30
        Click Element     ${BTN_SIM TX SERVIÇO}
        # momento da quantidade de pessoa
        Clear Text        ${TXT_QTD PESSOA MESA}
        Sleep    1s
        Input Text        ${TXT_QTD PESSOA MESA}    1
        Sleep    1s
        Click Element     ${BTN_CONFIRMAR} 
        Wait Until Element Is Visible    ${BTN_OK ANDROID}    60
        Click Element     ${BTN_OK ANDROID}
        Wait Until Element Is Visible    ${TXT_NUM MESA}   20    
    
Fechar mesa sem taxa
    [Arguments]    ${NUM_MESA}    ${SENHA_GERENTE}
    Wait Until Element Is Visible    ${TXT_NUM MESA}    20
    Input Text    ${TXT_NUM MESA}    ${NUM_MESA}
    Click Element    ${BTN_FECHARMESA}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    50
    Click Element    ${BTN_CONFIRMAR} 
    Wait Until Element Is Visible    ${BTN_NAO TX SERVIÇO}    30
    Click Element    ${BTN_NAO TX SERVIÇO}
    Wait Until Element Is Visible    ${USUARIO_SENHA GERENTE}    20
    Click Element    ${USUARIO_SENHA GERENTE}
    Wait Until Element Is Visible    ${TXT_SENHA GERENTE}    10
    Input Text    ${TXT_SENHA GERENTE}    ${SENHA_GERENTE}
    Sleep    2s
    Click Element    ${BTN_ACESSAR}
    # momento da quantidade de pessoa
    Wait Until Element Is Visible    ${TXT_QTD PESSOA MESA}
    Clear Text    ${TXT_QTD PESSOA MESA}
    Sleep    1s
    Input Text    ${TXT_QTD PESSOA MESA}    1
    Sleep    1s
    Click Element    ${BTN_CONFIRMAR} 
    Wait Until Element Is Visible    ${BTN_OK ANDROID}    60
    Click Element    ${BTN_OK ANDROID}
    Wait Until Element Is Visible    ${TXT_NUM MESA}    20


    
Fechamento parcial - 1 item - com taxa
    [Arguments]    ${NUM_MESA}
    Wait Until Element Is Visible    ${TXT_NUM MESA}    20
    Input Text    ${TXT_NUM MESA}    ${NUM_MESA}
    Sleep    1s
    Click Element     ${BTN_FINALIZAR MESA}
    Sleep    2s
    Click Element     ${BTN_PGTO PARCIAL}
    Wait Until Element Is Visible    ${TXT_PGTO PARCIAL}    30
    Click Element     ${BTN_+_PGTO PARCIAL}
    Sleep    2s
    Click Element    ${BTN_CONFIRMAR_PGTO PARCIAL} 
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}    20
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_SIM TX SERVIÇO}    20
    Click Element    ${BTN_SIM TX SERVIÇO}
    Wait Until Element Is Visible    ${BTN_CONFIRMAR}
    Click Element    ${BTN_CONFIRMAR}
    Wait Until Element Is Visible    ${BTN_FINALIZAR}    30


Validação para verificar se mesa foi fechada
    [Arguments]    ${NUM_MESA}
    Wait Until Element Is Visible    ${TXT_NUM MESA}    20
    Input Text    ${TXT_NUM MESA}    ${NUM_MESA}
    Sleep    1s
    Click Element     ${BTN_CONFIRMAR MESA}
    Sleep    2s
    Wait Until Element Is Visible    ${BTN_NAO_MESA}    20
    Click Element     ${BTN_NAO_MESA}
    Wait Until Element Is Visible    ${TXT_NUM MESA}    20








