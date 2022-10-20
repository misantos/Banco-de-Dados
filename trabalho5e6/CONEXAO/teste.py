import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="malaquias", 
  database="dbfichamedica")
if (mydb.is_connected()):
    print("-> Conexão realizada com sucesso!")
    print("\n")
else:
    print("Não foi possível realizar a conexão. Tente novamente!")

sql = mydb.cursor()

fr = "SELECT nroPaciente,nomePaciente, dataNascimento, sexo_siglasexo, estadocivil_idestadocivil, rgPaciente, endereco_idendereco,fonePaciente FROM paciente join fone on nroPaciente = paciente_nroPaciente"
sql.execute(fr)
resultado = sql.fetchall()
for registro in resultado:
    print('Nro Paciente:',registro[0])
    print('Nome Paciente:',registro[1])
    print('Data de Nascimento:', registro[2])
    print('Sexo:', registro[3])
    print('Estado Civil:', registro[4])
    print('fone:',registro[5])
    print('\n')

sql.close()
mydb.commit()
mydb.close()