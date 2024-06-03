*** Settings ***
Library    AppiumLibrary
Library    libs/firebird.py

Resource    ../Steps/steps_mesa.robot
Resource    ../Steps/steps_papafila.robot
Resource    ../Steps/steps_pagamento.robot
Resource    ../Steps/steps_login.robot

*** Keywords ***
Abrir App
    Open Application    http://localhost:4723/wd/hub
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Teste
    ...                 appPackage=br.com.efetiva.degust.activity
    #...                 appActivity=br.com.efetiva.habibshomolog.feature.ui.activity.ACTConfiguracao
    #...                 appActivity=br.com.efetiva.habibshomolog.feature.ui.activity.ACTConfiguracao


    #...                 app=${EXECDIR}/app/degustmobile.apk
    ...                 app=C:\\Users\\mario.moretto\\Documents\\QA_Automação\\LinxDegustMobile-TestAutomation\\automacao_robot\\DegustMobile_Stone\\app\\degustmobile.apk
    #...                 udid=494b475834593398
    ...                 udid=4AF30P928
    #...                 udid=PBF921CE70418             
    #...                 udid=emulator-5556
    #...                 udid=emulator-5554
    ...                 noReset=${True}
    
    # checkpoint para garantir se estamos no lugar certo
    Wait Until Element Is Visible    id=br.com.efetiva.degust.activity:id/autenticacao_lstUsuarios    60
    

Fechar App
    #tira um print de como ficou o app no fim da execução do teste
    Capture Page Screenshot
    # fecha aplicação
    Close Application


