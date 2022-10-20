from pymongo import MongoClient

cliente = MongoClient('localhost', 27017)
banco = cliente.MatriculaAluno
alunoTabela = banco.Aluno
cursoCollection = banco.Curso

print('Buscando pelo nome Jefferson.....')
nomeProcurado = { "nome": "Jefferson Rodrigues" }

recebeNome = alunoTabela.find(nomeProcurado)

for x in recebeNome:
    print(x) 

print('\n')
print('Buscando pelo curso de Matematica.....')
cursoProcurado = { "nomeCurso": "Matematica" }

recebeCurso = cursoCollection.find(cursoProcurado)

for x in recebeCurso:
    print(x) 