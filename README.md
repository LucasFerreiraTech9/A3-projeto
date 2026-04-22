# 🧠 Validador Básico de Código C com Flex e Bison

![C](https://img.shields.io/badge/C-Language-blue.svg)
![Flex](https://img.shields.io/badge/Flex-Lexical%20Analyzer-green)
![Bison](https://img.shields.io/badge/Bison-Parser-orange)
![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)

---

## 📌 Sobre o projeto

Este projeto implementa um **validador básico de código C**, utilizando as ferramentas clássicas de compiladores:

- 🔹 **Flex** → responsável pela análise léxica  
- 🔹 **Bison** → responsável pela análise sintática  

Além disso, o sistema realiza **validações semânticas básicas**, como:

- ✔️ Verificação de variável declarada antes do uso  
- ✔️ Prevenção de redeclaração  
- ✔️ Compatibilidade de tipos em atribuições  

---

## 🧠 Conceito do funcionamento

O fluxo do programa segue a arquitetura clássica de compiladores:

Código C → Análise Léxica → Análise Sintática → Validação Semântica

### 🔹 Análise Léxica (Flex)
Transforma o código em tokens:

int idade;
→ TIPO ID SEMICOLON


### 🔹 Análise Sintática (Bison)
Valida se a estrutura é correta:

TIPO ID SEMICOLON ✔ válido
ID = NUM ; ✔ válido

### 🔹 Validação Semântica
Verifica o sentido do código:

int x;
x = "Lucas"; ❌ (erro de tipo)


## 🚀 Tecnologias utilizadas

- 🟦 Linguagem C  
- 🟩 Flex (Lexical Analyzer)  
- 🟧 Bison (Parser Generator)  
- 🐧 WSL (Ubuntu)  
- ⚙️ GCC  


## 📂 Estrutura do projeto

sql-validator-flex-bison/
│
├── lexer.l
├── parser.y
├── exemplos/
│ ├── validos.txt
│ └── invalidos.txt
├── README.md
└── .gitignore

## ⚙️ Como executar o projeto

### 1. Instalar dependências

No WSL (Ubuntu):

```bash
sudo apt update
sudo apt install flex bison gcc

### 2. Gerar o parser (Bison)

bison -d parser.y

Arquivos gerados:

parser.tab.c
parser.tab.h

### 3. Gerar o analisador léxico (Flex)

flex lexer.l

Arquivo gerado:

lex.yy.c

### 4. Compilar

gcc parser.tab.c lex.yy.c -o validadorparser -lfl

### 5. Executar

./validadorparser

Finalize a entrada com:

Ctrl + D



## Validações implementadas

✔️ Declaração de variáveis (int, float, char)
✔️ Atribuições numéricas e de string
✔️ Uso correto de variáveis
✔️ Verificação de tipos
✔️ Tabela de símbolos

## Limitações

Este projeto NÃO implementa toda a linguagem C.

Não suporta:

❌ if, for, while
❌ funções
❌ ponteiros
❌ arrays
❌ expressões complexas

    O foco é educacional, demonstrando conceitos de compiladores.

## Objetivo

Demonstrar na prática o funcionamento de um sistema de validação de código baseado em:

análise léxica
análise sintática
análise semântica básica

## Observação

Projeto desenvolvido para fins acadêmicos na disciplina de:

Teoria da Computação e Compiladores