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

"if" 				    { return IF; }
"array" 				{ return ARRAY; }
"boolean" 				{ return BOOLEAN; }
"else" 				    { return ELSE; }
"false" 				{ return FALSE; }
"true" 				    { return TRUE; }
"for" 				    { return FOR; }
"function" 				{ return FUNCTION; }
"integer" 				{ return INTEGER; }
"print" 				{ return PRINT; }
"return" 				{ return RETURN; }
"string" 				{ return STRING; }
"void" 				    { return VOID; }
"while" 				{ return WHILE; }
"char"				    { return CHAR; }

"<="				    { return LTE; }
"=="				    { return EQ; }
">="				    { return GTE; }
"!="				    { return NE; }
"++"				    { return PP; }
"--"				    { return MM; }
"&&"				    { return AND; }
"||"				    { return OR; }

"+" 				    { return PLUS; }
"-"  				    { return MINUS; }
"*"  				    { return MUL; }
"/" 				    { return DIV; } 
"%" 				    { return PERCENT; } 
"!" 				    { return NOT; } 
"<" 				    { return LT; } 
">" 				    { return GT; } 
"=" 				    { return IS; }
":" 				    { return COLON; } 
";" 				    { return SEMICOLON; } 
"," 				    { return COMMA; } 
"(" 				    { return LPAREN; } 
")" 				    { return RPAREN; } 
"[" 				    { return LBRACKET; }
"]" 				    { return RBRACKET; } 
"{" 				    { return LBRACE; } 
"}" 				    { return RBRACE; } 




(" "|\t|\n|\r)  // skip whitespace
\/\/.*   // skip comment
{DIGIT}+("."{DIGIT}+)?    {print_token("NUM",yytext); }
({DIGIT}|{LCLETTER}|{UCLETTER}|\_)+     {print_token("ID", yytext); }
(\'"\'"\'|\'.+\')     {print_token("CHAR", yytext); }
(\".+\")     {print_token("STR", yytext); }
.           { print_token("ERROR", yytext); }

%%
