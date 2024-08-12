/* token.h */

typedef enum {
        ID = 256, 
	NUM, 
        IF,
	ARRAY,
	BOOLEAN,
	ELSE,
	FALSE,
	TRUE,
	FOR,
	FUNCTION,
	INTEGER,
	PRINT,
	RETURN,
	STRING,
	VOID,
	WHILE,
        LTE,
        EQ,
        GTE,
        NE,
        PP,
        MM,
        AND,
        OR,
        CHAR,
	STR,
	ERROR,
        "+" = 43,
        "-" = 45,  
        "*" = 42,  
        "/" = 47,  
        "%" = 37,  
        "!" = 33,  
        "<" = 60,  
        ">" = 62,  
        "=" = 61,
        ":" = 58,  
        ";" = 59,  
        "," = 44,  
        "(" = 40,  
        ")" = 41,  
        "[" = 91,
        "]" = 93,  
        "{" = 123,  
        "}" = 125
} token_t; 
