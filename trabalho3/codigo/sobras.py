from pymongo import MongoClient

cliente = MongoClient('localhost', 27017)
banco = cliente.MatriculaAluno
alunoTabela = banco.Aluno
cursoCollection = banco.Curso
#alunos = {
#            "nome": "Maria Santana",
#            "cpfAluno": "22244411133",
#            "fone": "44998635241",
#            "email": "marriasantana1@gmail.com"
#            }

#alunoid = alunoTabela.insert_one(alunos)
#print('One post: {0}'.format(alunoid.inserted_id))

#A = alunoTabela.find()
#print(A)

def consultarAlunos():
    for x in alunoTabela.find():
        print(x)

def consultarCursos():
    for x in cursoCollection.find():
        print(x)

def procurarAluno:
    nomeAluno = input('Nome do aluno: ')
    #myquery = { "address": "Park Lane 38" }

    mydoc = mycol.find(nomeAluno)

    for x in mydoc:
        print(x) 

