# -*- coding: utf-8 -*-
from datetime import date
import mysql.connector
from mysql.connector import errorcode

try:
    mydb = mysql.connector.connect(
        user='root', password='1234', database='dbproduto')
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


##--- EXERCICIO 1 --> CONSULTAS ---##

# CONSULTA 1 --> Nome de todos os produtos cadastrados
  def select_all_products():
    sql = mydb.cursor()
    #Listar o nome de todos os produtos cadastrados
    query = "SELECT nomePro FROM produto;"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# A - Nome de todos os produtos cadastrados #\n')
    for registro in resultado:
        print('nomePro:', registro[0])
        print("\n") 
        print('-----------------------------------------------------------------------\n')  

# CONSULTA 2 --> Nome e Código de todos os produtos cujo precoVenda > 100
  def select_products_over100():
    sql = mydb.cursor()
    #Listar o nome e o codigo de todos os produtos cadastrados cujo precoVenda>100
    query = "SELECT codPro,nomePro FROM produto WHERE precoVenda > 100;"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# B - Código e nome de todos os produtos cadastrados com PrecoVenda > 100 #\n')
    for registro in resultado:
        print('codPro:', registro[0])
        print('nomePro:', registro[1])
        print("\n")
        print('----------------------------------------------------------------------\n')  

# CONSULTA 3 --> Código de todos os produtos que tenham registro de compra e venda
  def select_products_code_buy_sale():
    sql = mydb.cursor()
    #Listar o código de todos os produtos que tenham registro de compra e venda
    query = "SELECT codPro FROM produto WHERE codPro IN (SELECT codPro FROM produto, itemcompra, itemvenda WHERE produto.codPro = itemcompra.produto_codPro AND produto.codPro = itemvenda.produto_codPro GROUP BY codPro);"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# C - Código de todos os produtos que tenham registro de compra e venda #\n')
    for registro in resultado:
        print('codPro:', registro[0])
        print("\n")
        print('----------------------------------------------------------------------\n')  

# CONSULTA 4 --> Código de todos os produtos que não tem registro de venda ainda
  def select_products_code_no_sale():
    sql = mydb.cursor()
    #Listar o código de todos os produtos que não tem registro de venda aindaa
    query = "SELECT codPro FROM produto WHERE codPro NOT IN (SELECT codPro FROM produto, itemvenda WHERE produto.codPro = itemvenda.produto_codPro GROUP BY codPro);"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# D - Código de todos os produtos que não tem registro de venda ainda #\n')
    for registro in resultado:
        print('codPro:', registro[0])
        print("\n")
        print('----------------------------------------------------------------------\n')  

# CONSULTA 5 --> Codigo de todos os produtos que não tem registro de compra e venda
  def select_products_no_sale_no_buy():
    sql = mydb.cursor()
    #Listar o codigo de todos os produtos que não tem registro de compra e venda
    query = "SELECT codPro FROM produto WHERE codPro NOT IN (SELECT codPro FROM produto, itemcompra, itemvenda WHERE produto.codPro = itemcompra.produto_codPro AND produto.codPro = itemvenda.produto_codPro GROUP BY codPro);"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# E - Codigo de todos os produtos que não tem registro de compra e venda #\n')
    for registro in resultado:
        print('codPro:', registro[0])
        print("\n")
        print('----------------------------------------------------------------------\n')  

# CONSULTA 6 --> Nome de todos os clientes cadastrados
  def select_all_clients():
    sql = mydb.cursor()
    #Listar o nome de todos os clientes cadastrados
    query = "SELECT nome FROM cliente;"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# F - Nome de todos os clientes cadastrados #\n')
    for registro in resultado:
        print('nome:', registro[0])
        print("\n")
        print('----------------------------------------------------------------------\n')  


##--- EXERCICIO 2 --> CONSULTAS ---##

# CONSULTA 1 --> Nome de todos os produtos que tem venda
  def select_products_sale():
    sql = mydb.cursor()
    #Listar o nome de todos os produtos que tem venda
    query = "SELECT nomePro FROM produto, itemvenda where produto.codPro = itemvenda.produto_codPro group by nomePro;"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# A - Nome de todos os produtos que tem venda #\n')
    for registro in resultado:
        print('nomePro:', registro[0])
        print("\n") 
        print('---------------------------------------------------------------------\n')  

# CONSULTA 2 --> Nome de todos os clientes que tem NotaVenda realizada em 2021
  def select_clients_sale_2021():
    sql = mydb.cursor()
    #Listar o nome de todos os clientes que tem NotaVenda realizada em 2021
    query = "SELECT nome FROM cliente, notavenda WHERE cliente.codCliente = notavenda.cliente_codCliente AND str_to_date(notavenda.dataVenda, '%Y-%m-%d') between str_to_date('2021-01-01', '%Y-%m-%d') and str_to_date('2021-12-31', '%Y-%m-%d') GROUP BY nome;"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# B - Nome de todos os clientes que tem NotaVenda realizada em 2021 #\n')
    for registro in resultado:
        print('nome:', registro[0])
        print("\n") 
        print('---------------------------------------------------------------------\n')  

# CONSULTA 3 --> Nome de todos os produtos que não tem venda registrada
  def select_products_no_sale():
    sql = mydb.cursor()
    #Listar o nome de todos os produtos que não tem venda registrada
    query = "SELECT nomePro FROM produto WHERE nomePro NOT IN (SELECT nomePro FROM produto, itemvenda WHERE produto.codPro = itemvenda.produto_codPro GROUP BY nomePro);"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# C - Nome de todos os produtos que não tem venda registrada #\n')
    for registro in resultado:
        print('nomePro:', registro[0])
        print("\n") 
        print('---------------------------------------------------------------------\n')  

# CONSULTA 4 --> Nome de todos os produtos que tem compra mas não tem venda registrada
  def select_products_buy_no_sale():
    sql = mydb.cursor()
    #Listar o nome de todos os produtos que tem compra mas não tem venda registrada
    query = "SELECT nomePro FROM produto, itemcompra WHERE produto.codPro = itemcompra.produto_codPro AND nomePro NOT IN (SELECT nomePro FROM produto, itemvenda WHERE produto.codPro = itemvenda.produto_codPro GROUP BY nomePro);"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# D - Nome de todos os produtos que tem compra mas não tem venda registrada #\n')
    for registro in resultado:
        print('nomePro:', registro[0])
        print("\n") 
        print('---------------------------------------------------------------------\n')  

# CONSULTA 5 --> Nome de todos os clientes que não tem venda registrada em 2021
  def select_clients_no_sale():
    sql = mydb.cursor()
    #Listar o nome de todos os clientes que não tem venda registrada em 2021
    query = "SELECT nome FROM cliente WHERE nome NOT IN (SELECT nome from cliente, notavenda WHERE cliente.codCliente = notavenda.Cliente_codCliente and str_to_date(notavenda.dataVenda, '%Y-%m-%d') between str_to_date('2021-01-01', '%Y-%m-%d') and str_to_date('2021-12-31', '%Y-%m-%d') GROUP BY nome);"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# E - Nome de todos os clientes que não tem venda registrada em 2021 #\n')
    for registro in resultado:
        print('nome:', registro[0])
        print("\n") 
        print('---------------------------------------------------------------------\n')  

# CONSULTA 6 --> Produto com o MAIOR preco de Venda cadastrado
  def select_single_product_expensive():
    sql = mydb.cursor()
    #Listar o produto com o MAIOR preco de Venda cadastrado
    query = "SELECT nomePro, precoVenda FROM produto WHERE precoVenda = (SELECT max(precoVenda) FROM produto);"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# F - Produto com o MAIOR preco de Venda cadastrado #\n')
    for registro in resultado:
        print('nomePro:', registro[0])
        print("\n") 
        print('---------------------------------------------------------------------\n')  

##--- EXERCICIO 3 --> CONSULTAS ---##

# CONSULTA 1 --> Nome de todos os clientes e profissão caso tenham 
  def select_all_clients_professions():
    sql = mydb.cursor()
    #Listar o nome de todos os clientes e profissão caso tenham 
    query = "SELECT nome, nomeProfissao FROM cliente, profissao WHERE profissao_idprofissão = idprofissão GROUP BY nomeProfissao;"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# A - Nome de todos os clientes e profissão caso tenham #\n')
    for registro in resultado:
        print('nome:', registro[0])
        print('nomeProfissao:', registro[1])
        print("\n") 
        print('---------------------------------------------------------------------\n')  

# CONSULTA 2 --> Nome de todos os clientes apenas com a profissao informada
  def select_only_clients_professions():
    sql = mydb.cursor()
    #Listar o nome de todos os clientes apenas com a profissao informada
    query = "SELECT nome, nomeProfissao FROM cliente, profissao WHERE cliente.profissao_idprofissão = profissao.idprofissão AND profissao.nomeProfissao != '' GROUP BY nomeProfissao;"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# B - Nome e profissao de todos os clientes apenas com a profissao informada #\n')
    for registro in resultado:
        print('nome:', registro[0])
        print('nomeProfissao:', registro[1])
        print("\n") 
        print('---------------------------------------------------------------------\n')  

# CONSULTA 3 --> Nome de todos os produtos que tem registro em venda e em compra em março de 2021
  def select_products_march():
    sql = mydb.cursor()
    #Listar o nome de todos os produtos que tem registro em venda e em compra em março de 2021
    query = " SELECT nomePro FROM produto, itemvenda, itemcompra, notacompra, notavenda WHERE produto.codPro = itemvenda.produto_codPro AND produto.codPro = itemcompra.produto_codPro AND itemvenda.nroVenda = notavenda.itemvenda_nroVenda AND itemcompra.nroCompra = notacompra.itemcompra_nroCompra AND ((MONTH(data) = '03' AND YEAR(data) = '2021') OR (MONTH(dataVenda) = '03' AND YEAR(dataVenda) = '2021')) GROUP BY nomePro;"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# C - Nome de todos os produtos que tem registro em venda e em compra em março de 2021 #\n')
    for registro in resultado:
        print('nomePro:', registro[0])
        print("\n") 
        print('---------------------------------------------------------------------\n')  

# CONSULTA EXTRA --> Produto Cartesiano de Nota Venda com Cliente
  def select_cartesiano():
    sql = mydb.cursor()
    #Produto Cartesiano de Nota Venda com Cliente
    # NOTA X CLIENTE = 7 X 16 = 112
    query = "SELECT * FROM notavenda, cliente;"
    sql.execute(query)
    resultado = sql.fetchall()
    print('# EXTRA - Produto Cartesiano de Nota Venda com Cliente #\n')
    for registro in resultado:
        print('nroVenda:', registro[0])
        print('cliente_codCliente:', registro[1])
        print('dataVenda:', registro[2])
        print('totalVenda:', registro[3])
        print('codCliente:', registro[4])
        print('nome:', registro[5])
        print('idProfissao:', registro[6])
        print("\n") 
        print('---------------------------------------------------------------------\n')  
    print("TOTAL = 112 registros\n")

print('*Digite 1 para realizar as consultas do Exercicio 1 ')
print('*Digite 2 para realizar as consultas do Exercicio 2')
print('*Digite 3 para realizar as consultas do Exercicio 3')
print('*Digite 4 para realizar o Produto Cartesiano\n')
numero = input()
while(int(numero) <= 4):

    if int(numero) == 1:
        #CONSULTAS EXERCICIO 1
        select_all_products() #A
        select_products_over100() #B
        select_products_code_buy_sale() #C
        select_products_code_no_sale() #D
        select_products_no_sale_no_buy() #E
        select_all_clients() #F
        
    elif int(numero) == 2:
        #CONSULTAS EXERCICIO 2
        select_products_sale() #A
        select_clients_sale_2021() #B
        select_products_no_sale() #C
        select_products_buy_no_sale() #D
        select_clients_no_sale() #E 
        select_single_product_expensive() #F

    elif int(numero) == 3:
        #CONSULTAS EXERCICIO 3
        select_all_clients_professions() #A
        select_only_clients_professions() #B
        select_products_march() #C

    elif int(numero) == 4:
        #PRODUTO CARTESIANO
        select_cartesiano() #EXTRA
        

    print('*Digite 1 para realizar as consultas do Exercicio 1 ')
    print('*Digite 2 para realizar as consultas do Exercicio 2')
    print('*Digite 3 para realizar as consultas do Exercicio 3')
    print('*Digite 4 para realizar o Produto Cartesiano\n')
    numero = input()
    

print('Numero invalido\n')
sql.close()
mydb.commit()
mydb.close()
    
