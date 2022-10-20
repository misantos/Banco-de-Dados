# -*- coding: utf-8 -*-
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="12345",
  database="dbfatura")
if (mydb.is_connected()):
    print("-> Conexão realizada com sucesso!")
    print("\n")
else:
    print("Não foi possível realizar a conexão. Tente novamente!")

sql = mydb.cursor()

   # CONSULTA EXTRA --> EXIBE TODOS OS CLIENTES CADASTRADOS
   #query = "SELECT * FROM Cliente" 

   

def select_FaturaData():
   # CONSULTA 3 --> FATURAS PAGAS EM UM DETERMINADO DIA
   query = " SELECT numeroFatura, dataEmissaoFatura, totalFatura, idParcela, Cliente_idCliente FROM fatura, parcela WHERE fatura.dataEmissaoFatura ='2021-03-15' AND fatura.Parcela_idParcela = parcela.idParcela"
   
   sql.execute(query)
   resultado = sql.fetchall()
   for registro in resultado:
      print('numeroFatura: ', registro[0])
      print('dataEmissaoFatura: ', registro[1])
      print('totalFatura: ', registro[2])
      print('idParcela: ', registro[3])
      print('Cliente_idCliente: ', registro[4])
      print('\n')
      #print(registro)


def select_FaturaCliente(elem):
   sql = mydb.cursor()

   # CONSULTA 1 --> CONSULTA QUE REPRESENTA A TELA DE CONSULTA DE FATURA DO CLIENTE 
   query = "SELECT numeroFatura,dataEmissaoFatura, totalFatura, saldoAPagar,Parcela_idParcela,Cliente_idCliente FROM Fatura WHERE Cliente_idCliente = %s"
   valor = (str(elem),)
    
   sql.execute(query, valor)
   resultado = sql.fetchall()
   for registro in resultado:
      print('numeroFatura:',registro[0])
      print('dataEmissaofatura:',registro[1])
      print('totalFatura:', registro[2])
      print('saldoAPagar:', registro[3])
      print('Parcela_idParcela:', registro[4])
      print('Cliente_idCliente:',registro[5])
     
      print('\n')
     
      
def select_Faturas_NaoPagas():
    
   # CONSULTA 2 --> QUAIS FATURAS ESTAO VENCIDAS E NAO PAGAS
   query = "SELECT numeroFatura, dataEmissaofatura, Parcela_idParcela,vencimentoParcela, situacaoParcela FROM fatura, parcela, situacaoParcela WHERE fatura.Parcela_idParcela = parcela.idParcela AND  parcela.SituacaoParcela_siglaSituacaoparcela = 'P' AND situacaoParcela = 'Pendente'"
   
   sql.execute(query)
   resultado = sql.fetchall()
   for registro in resultado:
      print('numeroFatura:',registro[0])
      print('dataEmissaofatura:',registro[1])
      print('Parcela_idParcela:', registro[2])
      print('vencimentoParcela:',registro[3])
      print('situacaoParcela:', registro[4])
     
      print('\n')
      #print(registro)


def select_Clientes_Cidade():
    
   # CONSULTA 4 --> LISTA DE CLIENTES QUE MORAM EM UMA DETERMINADA CIDADE
   query = "SELECT nomeCliente, idEnderecoResidencial, nomeCidade FROM  cliente, EnderecoResidencial, cidade WHERE EnderecoResidencial.Cidade_idCidade = Cidade.idCidade AND cliente.EnderecoResidencial_idEnderecoResidencial = EnderecoResidencial.idEnderecoResidencial AND  Cidade.nomeCidade = 'Missal'"
     
   sql.execute(query)
   resultado = sql.fetchall()
   for registro in resultado:
      print('nomeCliente:',registro[0])
      print('idEnderecoResidencial:',registro[1])
      print('nomeCidade:', registro[2])

      print('\n')
      #rint(registro)

def select_NomeCleinte_SaldoAPagar():
    
   # CONSULTA 5 --> LISTA DE CLIENTES (NOME E SALDO A PAGAR) DE CADA UM
   query = "SELECT nomeCliente,numeroFatura, saldoAPagar FROM cliente, fatura WHERE cliente.idCliente = fatura.Cliente_idCliente"
   
   
   sql.execute(query)
   resultado = sql.fetchall()
   for registro in resultado:
      print('nomeCliente:',registro[0])
      print('numerofatura:',registro[1])
      print('saldoAPagar:',registro[2])
      
      print('\n')
      #print(registro)
      
      
# CONSULTA 3 --> FATURAS PAGAS EM UM DETERMINADO DIA 
#select_FaturaData()
 
# CONSULTA 1 --> CONSULTA QUE REPRESENTA A TELA DE CONSULTA DE FATURA DO CLIENTE    
#select_FaturaCliente(3)
      
# CONSULTA 2 --> QUAIS FATURAS ESTAO VENCIDAS E NAO PAGAS    
#select_Faturas_NaoPagas()
      
# CONSULTA 4 --> LISTA DE CLIENTES QUE MORAM EM UMA DETERMINADA CIDADE    
#select_Clientes_Cidade()
      
#CONSULTA 5 --> LISTA DE CLIENTES (NOME E SALDO A PAGAR) DE CADA UM     
select_NomeCleinte_SaldoAPagar()
