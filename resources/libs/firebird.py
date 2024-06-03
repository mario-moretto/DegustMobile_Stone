import fdb
from robot.api.deco import keyword

@keyword('Setar senha padrão usuario')
def atualizar_senha_usuario():
    try:
        # Configurar a conexão com o banco de dados
        con = fdb.connect(
            host='localhost',
            database='C:\DegustWin\Dados\Degust.fdb',
            user='SYSDBA',
            password='masterkey'  # Defina a senha diretamente aqui
        )

        # Criar um cursor para executar a atualização
        cur = con.cursor()

        # Executar a atualização SQL
        sql = "update cadusuario set usu_senha = 'BFA98F908EF314'"
        cur.execute(sql)

        # Commit (confirmar) a transação
        con.commit()

        # Fechar a conexão
        con.close()

        print("Senha do usuário atualizada com sucesso!")

    except Exception as e:
        print(f"Erro ao atualizar senha do usuário: {str(e)}")

