%option noyywrap yylineno

%{

#include "token.h"

// Função para imprimir o token no formato especificado
void print_token(const char* token_class, const char* lexeme) {
    printf("(%d,%s,\"%s\")\n", yylineno, token_class, lexeme);
}
%}

DIGIT [0-9]
LCLETTER [a-z]
UCLETTER [A-Z]
%%

"if" 				{ return IF; } // incluir IF em token.h

(" "|\t|\n|\r)  // skip whitespace
\/\/.*   // skip comment
(array|boolean|char|else|false|for|function|if|integer|print|return|string|true|void|while)    {print_token("KEY", yytext); }
{DIGIT}+("."{DIGIT}+)?    {print_token("NUM",yytext); }
({DIGIT}|{LCLETTER}|{UCLETTER}|\_)+     {print_token("ID", yytext); }
(\'"\'"\'|\'.+\')     {print_token("CHAR", yytext); }
(\".+\")     {print_token("STR", yytext); }
("=="|"!="|"<="|">="|"\+\+"|"--"|"&&"|"||")    {print_token("SYMC", yytext); }
(\+|\-|\*|\/|\%|\!|\<|\>|\=|\:|\;|\,|\(|\)|\[|\]|\{|\})    {print_token("SYM", yytext); }
.           { print_token("ERROR", yytext); }

%%
