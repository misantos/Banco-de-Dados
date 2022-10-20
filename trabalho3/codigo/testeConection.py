# -*- coding: utf-8 -*-
from pymongo import MongoClient
import os

cliente = MongoClient('localhost', 27017)
banco = cliente.MatriculaAluno
alunoCollection = banco.Aluno
cursoCollection = banco.Curso
while True:
    print('Escolha uma opção:')
    print('1. Consultar Alunos')
    print('2. Consultar Cursos')
    opcao = int(input('Digite a opcao desejada: '))
    os.system('clear') or None
    if opcao == 1:
        for x in alunoCollection.find({},{ "_id": 0, "nome": 1, "cpfAluno": 1, "fone": 1, "email":1 }):
            print(x)
            print("\n")
    elif opcao == 2:
        for x in cursoCollection.find({},{ "_id": 0, "nomeCurso": 1}):
            print(x)
            print("\n")
    else:
        print('Opção inválida')
        break

    
