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
"+" 				    { return ["+"]; }
"-"  				    { return "-"; }
"*"  				    { return "*"; }
"/" 				    { return "/"; } 
"%" 				    { return "%"; } 
"!" 				    { return "!"; } 
"<" 				    { return "<"; } 
">" 				    { return ">"; } 
"=" 				    { return "="; }
":" 				    { return ":"; } 
";" 				    { return ";"; } 
"," 				    { return ","; } 
"(" 				    { return "("; } 
")" 				    { return ")"; } 
"[" 				    { return "["; }
"]" 				    { return "]"; } 
"{" 				    { return "{"; } 
"}" 				    { return "}"; } 




(" "|\t|\n|\r)  // skip whitespace
\/\/.*   // skip comment
{DIGIT}+("."{DIGIT}+)?    {print_token("NUM",yytext); }
({DIGIT}|{LCLETTER}|{UCLETTER}|\_)+     {print_token("ID", yytext); }
(\'"\'"\'|\'.+\')     {print_token("CHAR", yytext); }
(\".+\")     {print_token("STR", yytext); }
.           { print_token("ERROR", yytext); }

%%
