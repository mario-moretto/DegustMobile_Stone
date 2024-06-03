*** Variables ***
${USUARIO LOGIN}           xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.ListView/android.widget.LinearLayout[2]/android.widget.TextView    
${CAMPO TXT_SENHA}         id=br.com.efetiva.degust.activity:id/autenticacao_txtSenha 
${BTN_ACESSAR}             id=br.com.efetiva.degust.activity:id/rodape_btnLoginAcessar
${BTN_CONFIRMAR}           id=br.com.efetiva.degust.activity:id/rodape_btnConfirmarNovo   
${BTN_SIM}                 id=android:id/button1  
${BTN_CONCLUIR}            id=br.com.efetiva.degust.activity:id/rodape_btnConcluir 
${BTN_FECHARMESA}          id=br.com.efetiva.degust.activity:id/venda_mesa_numero_mesa_btnFecharMesa
${BTN_FINALIZAR}           id=br.com.efetiva.degust.activity:id/rodape_btnConfirmarNovo
${BTN_MENU_ATUALIZAÇÃO}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.GridView/android.widget.RelativeLayout[5]/android.widget.RelativeLayout/android.widget.ImageView
${BTN_MENU_VENDA MESA 1}   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.GridView/android.widget.RelativeLayout[2]/android.widget.RelativeLayout/android.widget.ImageView
${BTN_MODULO MESA}         xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.GridView/android.widget.RelativeLayout[1]/android.widget.RelativeLayout/android.widget.ImageView
${TXT_NUM MESA}            id=br.com.efetiva.degust.activity:id/venda_mesa_numero_mesa_txtNumeroMesa   
${BTN_CONFIRMAR MESA}      id=br.com.efetiva.degust.activity:id/btn_confirmar_venda_mesa_numero_mesa
${BTN_RESGATE RESHOP}      id=br.com.efetiva.degust.activity:id/btnResgatarProdutos  
${BTN_ITENS MESA}          id=br.com.efetiva.degust.activity:id/btnItensMesa  
${CPF RESHOP}              id=br.com.efetiva.degust.activity:id/edtCPF   
${TXT_PESQUISA PROD}       id=br.com.efetiva.degust.activity:id/ni_topo_pesquisa_txt 
${TXT_PROD QTD}            id=br.com.efetiva.degust.activity:id/atendimento_txtProdutoQuantidade
${BTN_OK PEDIDO}           id=br.com.efetiva.degust.activity:id/pedido_enviado_btnOk 
${AREA_MESA}               id=br.com.efetiva.degust.activity:id/venda_mesa_area_lblArea 
${BTN_TXT PESQUISA PROD}   id=br.com.efetiva.degust.activity:id/ni_topo_pesquisa_btn    
${BTN_SIM TX SERVIÇO}      id=br.com.efetiva.degust.activity:id/venda_mesa_taxa_servico_btnSim 
${BTN_NAO TX SERVIÇO}      id=br.com.efetiva.degust.activity:id/venda_mesa_taxa_servico_btnNao
${TXT_QTD PESSOA MESA}     id=br.com.efetiva.degust.activity:id/venda_mesa_individualizacao_txtQuantidade
${BTN_OK ANDROID}          id=android:id/button1 
${USUARIO_SENHA GERENTE}   id=br.com.efetiva.degust.activity:id/list_adapter_usuarios_txtUsuario
${TXT_SENHA GERENTE}       id=br.com.efetiva.degust.activity:id/autenticacao_txtSenha 
${BTN_FINALIZAR MESA}      id=br.com.efetiva.degust.activity:id/venda_mesa_numero_mesa_btnFinalizarMesa
${BTN_PGTO TOTAL MESA}     id=br.com.efetiva.degust.activity:id/btnPgtoTotal_dialog_custom
#MOMENTO PAGAMENTO
${CPF_NOTA FISCAL}         id=br.com.efetiva.degust.activity:id/identificacaocliente_txtDocumento
${BTN_ADICIONAR PGTO}      id=br.com.efetiva.degust.activity:id/pagamento_btnAdicionar 
${FINALIZADOR DINHEIRO}    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout[2]/android.widget.ListView/android.widget.LinearLayout[4]/android.widget.TextView
${FINALIZADOR_CARTAO}      xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout[2]/android.widget.ListView/android.widget.LinearLayout[2]/android.widget.TextView
${BTN_SUCESSO CIELO}       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.Button[1] 
${VALOR_SUBTOTAL}          id=br.com.efetiva.degust.activity:id/pagamento_txtSubtotal

${MSG_PGTO SUCESSO}        id=br.com.efetiva.degust.activity:id/pagamento_txtMsgSucesso
${TXT_AREA MESA}           id=br.com.efetiva.degust.activity:id/venda_mesa_area_txtArea
${BTN_PGTO PARCIAL}        id=br.com.efetiva.degust.activity:id/btn_PgtoParcial_dialog_custom
${TXT_PGTO PARCIAL}        id=br.com.efetiva.degust.activity:id/txt_valor_total_fechamento_parcial
${BTN_+_PGTO PARCIAL}      id=br.com.efetiva.degust.activity:id/button_item_incremento  
${BTN_CONFIRMAR_PGTO PARCIAL}    id=br.com.efetiva.degust.activity:id/btn_confirmar_fchto_parcial
${BTN_PAPA FILA}           xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.GridView/android.widget.RelativeLayout[1]/android.widget.RelativeLayout/android.widget.TextView
${BTN_NAO_MESA}            xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.Button[1]  
${VALOR_APAGAR}            id=br.com.efetiva.degust.activity:id/pagamento_txtAPagar
${TXT_PROMOCODE}           id=br.com.efetiva.degust.activity:id/edtPromoCode
${PRODUTO_1X1}             xpath=(//android.widget.ImageView[@content-desc="Produto"])[1]
${TOPO_ITEM_2}             id=br.com.efetiva.degust.activity:id/topo_txtBreadCrumbItem2  
${VALOR_PAGAMENTO}         id=br.com.efetiva.degust.activity:id/pagamento_txtValor


 
