*** Settings ***
Library    AppiumLibrary
Library    String
Resource    ../resources/base.robot
Resource    ../Elements/Mesa/Mesa_Elements.robot


*** Keywords ***
Clicar segundo usuario
    Click Element        ${USUARIO LOGIN} 
    #Click Text    GERENTE

Minha senha
    [Arguments]    ${senha}

    # O "Wait Until Page Contains Element" é pra aguardar X tempo até determinado item aparecer em tela 
    Wait Until Element Is Visible    ${CAMPO TXT_SENHA}
    #xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.ListView/android.widget.LinearLayout[2]/android.widget.TextView   10
    Input Text                       ${CAMPO TXT_SENHA}    ${senha}
    Click Element                    ${BTN_ACESSAR} 

Clicar Atualizacao
    Wait Until Element Is Visible    ${BTN_MENU_ATUALIZAÇÃO}     30
    Click Element                    ${BTN_MENU_ATUALIZAÇÃO}                   
    Wait Until Element Is Visible    ${BTN_SIM}                  10
    Click Element                    ${BTN_SIM} 
    Wait Until Element Is Visible    ${BTN_MENU_ATUALIZAÇÃO}     120