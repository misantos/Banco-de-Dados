from datetime import date
import mysql.connector
from mysql.connector import errorcode

try:
    cnx = mysql.connector.connect (user='root', password='senha',host='127.0.0.1',database='matricula_alunos')
    print("Conexao do banco de dados feita!")
    print("\n")
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Username ou senha errada.")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database nao existe.")
    else:
        print(err)
else:
    cursor = cnx.cursor()
    add_aluno = ("INSERT INTO Aluno "
                "(nomeAluno, cpfAluno, foneAluno, emailAluno, Endereco_idEndereco, nro_Casa, complementoEnderecoAluno) "
                "VALUES (%s, %s, %s, %s, %s, %s, %s)")
    
    #INSERINDO DADOS NA TABELA ALUNO

    data_aluno = ('Amanda Silva', '11478955214', '4599625141', 'amanda@gmail.com', '2', '23', 'esquina da farmacia')
    cursor.execute(add_aluno, data_aluno)
    print(cursor.rowcount, "Aluno cadastrado.")
    print("\n")

    #BUSCANDO DADOS NA TABELA ALUNO

    busca_aluno= ("SELECT nomeAluno, cpfAluno FROM Aluno")
    cursor.execute(busca_aluno)
    print("nome, CPF")
    for (nomeAluno, cpfAluno) in cursor:
        print(nomeAluno, cpfAluno)
    print("\n")

    #DELETANDO UM CADASTRO DE ALUNO PELO ID 
    sql = ("delete from Aluno where idAluno='5'")
    cursor.execute(sql)
    
    print(cursor.rowcount, "deletado.")
    print("\n")

    #ATUALIZANDO O TELEFONE DO ALUNO PELO ID
    print("Atualizando Aluno pelo id 17.");
    sql = ("update Aluno set foneAluno = '4499914236' where idAluno='17'")
    cursor.execute(sql)
    print(cursor.rowcount, "atualizado.")
    print("\n")
    atual = ("SELECT idAluno, nomeAluno, cpfAluno, foneAluno, emailAluno, Endereco_idEndereco, nro_Casa, complementoEnderecoAluno FROM Aluno")
    cursor.execute(atual)
    for (idAluno, nomeAluno, cpfAluno, foneAluno, emailAluno, Endereco_idEndereco, nro_Casa, complementoEnderecoAluno) in cursor:
        print(idAluno, nomeAluno, cpfAluno, foneAluno, emailAluno, Endereco_idEndereco, nro_Casa, complementoEnderecoAluno)
    print("\n")
    
    cursor.close()
    cnx.commit()
    cnx.close()