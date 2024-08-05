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
        SYM,  
        SYMC, 
        CHAR,
	STR,
	ERROR
} token_t; 

