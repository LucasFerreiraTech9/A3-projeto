%{
#include "parser.tab.h"
%}

%%

"int" | "float" | "char"        { return TIPO; }
[a-zA-Z_][a-zA-Z0-9_]*        { return ID; }
[0-9]+        { return NUM; }

";"             { return SEMICOLON; }
"="             { return EQUALS; }

\'[^\']*\'      { yylval.str = strdup(yytext); return STRING; }

[ \t\r\n]+      { /* ignora espaços */ }


%%
