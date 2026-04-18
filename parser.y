%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
int yyerror(const char *s);

/* ---------------- TABELA DE SÍMBOLOS ---------------- */

typedef struct {
    char nome[50];
    char tipo[10];
} Simbolo;

Simbolo tabela[100];
int totalSimbolos = 0;

int buscarSimbolo(const char *nome) {
    for (int i = 0; i < totalSimbolos; i++) {
        if (strcmp(tabela[i].nome, nome) == 0) {
            return i;
        }
    }
    return -1;
}

void adicionarSimbolo(const char *nome, const char *tipo) {
    if (buscarSimbolo(nome) != -1) {
        printf("Erro semântico: variável '%s' já declarada.\n", nome);
        return;
    }

    strcpy(tabela[totalSimbolos].nome, nome);
    strcpy(tabela[totalSimbolos].tipo, tipo);
    totalSimbolos++;
}

const char* obterTipo(const char *nome) {
    int pos = buscarSimbolo(nome);
    if (pos == -1) return NULL;
    return tabela[pos].tipo;
}
%}

%union {
    int num;
    char *str;
}

%token <str> TIPO ID STRING
%token <num> NUM
%token SEMICOLON EQUALS

%%

program:
      program statement
    | /* vazio */
    ;

statement:
      declaration
    | assignment
    ;

declaration:
    TIPO ID SEMICOLON
    {
        if (buscarSimbolo($2) == -1) {
            adicionarSimbolo($2, $1);
            printf("Declaração válida: tipo=%s, variável=%s\n", $1, $2);
        } else {
            printf("Erro semântico: variável '%s' já declarada.\n", $2);
        }
    }
    ;

assignment:
    ID EQUALS NUM SEMICOLON
    {
        const char *tipo = obterTipo($1);

        if (tipo == NULL) {
            printf("Erro semântico: variável '%s' não declarada.\n", $1);
        } else if (strcmp(tipo, "int") == 0 || strcmp(tipo, "float") == 0) {
            printf("Atribuição válida: %s = %d\n", $1, $3);
        } else {
            printf("Erro semântico: variável '%s' do tipo '%s' não pode receber número.\n", $1, tipo);
        }
    }
    | ID EQUALS STRING SEMICOLON
    {
        const char *tipo = obterTipo($1);

        if (tipo == NULL) {
            printf("Erro semântico: variável '%s' não declarada.\n", $1);
        } else if (strcmp(tipo, "char") == 0) {
            printf("Atribuição válida: %s = %s\n", $1, $3);
        } else {
            printf("Erro semântico: variável '%s' do tipo '%s' não pode receber string.\n", $1, tipo);
        }
    }
    ;

%%

int main(void) {
    printf("Validador de código C básico\n");
    printf("Digite o código e pressione Ctrl+D para finalizar:\n\n");
    return yyparse();
}

int yyerror(const char *s) {
    printf("Erro sintático: %s\n", s);
    return 0;
}