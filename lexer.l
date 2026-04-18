%{
#include "parser.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%

int|float|char                 { yylval.str = strdup(yytext); return TIPO; }

[a-zA-Z_][a-zA-Z0-9_]*         { yylval.str = strdup(yytext); return ID; }

[0-9]+                         { yylval.num = atoi(yytext); return NUM; }

\"[^\"]*\"                     { yylval.str = strdup(yytext); return STRING; }

";"                            { return SEMICOLON; }
"="                            { return EQUALS; }

[ \t\r\n]+                     { /* ignora espaços */ }

.                              { printf("Erro léxico: caractere inválido '%s'\n", yytext); }

%%

int yywrap(void) {
    return 1;
}
