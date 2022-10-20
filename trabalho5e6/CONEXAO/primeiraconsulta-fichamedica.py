# -*- coding: utf-8 -*-
from datetime import date
import mysql.connector
from mysql.connector import errorcode

try:
    mydb = mysql.connector.connect(
        user='root', password='malaquias', host='127.0.0.1', database='dbfichamedica')
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

    sql = mydb.cursor()

    #Realiza a primeira consulta, de acordo com a ficha medica apresentada no exercicio
    # CONSULTA QUE REPRESENTA A TELA DE CONSULTA DA FICHA MEDICA DO PACIENTe
    def select_FichaMedica(elem):
        sql = mydb.cursor()
        print('\nFicha Médica\n')
        #apresenta os dados do paciente
        query = "SELECT nroPaciente,nomePaciente, dataNascimento, sexo_siglasexo, estadocivil, rgPaciente,fonePaciente FROM paciente join fone on nroPaciente = paciente_nroPaciente join estadocivil on idestadocivil = estadocivil_idestadocivil where nroPaciente = %s"
        valor = (str(elem),)
        sql.execute(query, valor)
        resultado = sql.fetchall()
        for registro in resultado:
            print('Nro Paciente:', registro[0])
            print('Nome Paciente:', registro[1])
            print('Data de Nascimento:', registro[2])
            print('Sexo:', registro[3])
            print('Estado Civil:', registro[4])
            print('Documento de Identidade:', registro[5])
            print('Fone:', registro[6])

        #apresenta o endereco do paciente
        query1 = "SELECT tipologradouro_siglaTipologradouro, nomeLogradouro, nomeBairro FROM logradouro join endereco on idlogradouro = logradouro_idlogradouro join bairro on idBairro = bairro_idBairro where idendereco = %s"
        valor1 = (str(elem),)
        sql.execute(query1, valor1)
        resultado1 = sql.fetchall()
        for registro in resultado1:
            print('Endereco:', registro[0], registro[1], registro[2])

        #apresenta o email do paciente
        query2 = "SELECT emailCliente FROM email WHERE paciente_nroPaciente = %s"
        valor2 = (str(elem),)
        sql.execute(query2, valor2)
        resultado2 = sql.fetchall()
        print('teste email')
        for registro in resultado2:
            print('Email:', registro[0])
            print('\n')

        #apresenta a consulta do paciente
        print('Lista Consultas realizadas\n')
        query3 = "SELECT nrconsulta, dataconsulta, nomeMedico, diagnostico from consulta join medico on medico_crmMedico = crmMedico join diagnostico on iddiagnostico = diagnostico_iddiagnostico WHERE paciente_nroPaciente = %s"
        valor3 = (str(elem),)
        sql.execute(query3, valor3)
        resultado3 = sql.fetchall()
        for registro in resultado3:
            print('Numero da consulta:', registro[0])
            print('Data da consulta:', registro[1])
            print('Nome do medico:', registro[2])
            print('Diagnostico:', registro[3])
            print('\n')

        #apresenta o exame do paciente
        print('Lista Exames realizadas\n')
        query4 = "SELECT nrexame, dataExame, nrconsulta, nomeExame from exames join consulta on nrconsulta = consulta_nrconsulta WHERE paciente_nroPaciente = %s"
        valor4 = (str(elem),)
        sql.execute(query4, valor4)
        resultado4 = sql.fetchall()
        for registro in resultado4:
            print('Numero do Exame:', registro[0])
            print('Data do Exame:', registro[1])
            print('Numero da consulta:', registro[2])
            print('Nome do Exame:', registro[3])
            print('\n')


    #Digite um id valido para realizar as consultas
    print('Digite o id do paciente: ')
    idPaciente = input()
    while(int(idPaciente) > 7):
        print('Digite o id do paciente: ')
        print('Id nao existe\n')
        idPaciente = input()
    select_FichaMedica(idPaciente)

    sql.close()
    mydb.commit()
    mydb.close()
