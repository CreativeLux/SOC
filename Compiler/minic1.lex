/* Devin Lumley v00175762 */
/* MiniC.l */

/*
    Specifies the lexical elements of the MiniC language.
    This file is in lex/flex format.
    
    Author:               Nigel Horspool
    Date of last change:  3 Sept 2009
*/

%option yylineno

INT [0-9]+
EXP ([eE][+-]?{INT})
NUM ({INT}\.?{INT}?|\.{INT}){EXP}?
%{
#include "MiniC.tab.h"  // header file generated by bison
extern int yylex();
extern void yyerror(char *msg);
%}
%start COMMENT1 COMMENT2

%%

<COMMENT1>.+		;
<COMMENT1>\n		{BEGIN 0;}	/* end comment */
<COMMENT2>[^*]+		;
<COMMENT2>\*[^/]	;
<COMMENT2>\*\/		BEGIN 0;	/* end comment */
"//"			BEGIN COMMENT1;
"/*"			BEGIN COMMENT2;
extern          {return KWD_EXTERN;}
int			    {return KWD_INT;}
float			{return KWD_FLOAT;}
char            {return KWD_CHAR;}
void            {return KWD_VOID;}
for			    {return KWD_FOR;}
while			{return KWD_WHILE;}
do				{return KWD_DO;}
break			{return KWD_BREAK;}
continue		{return KWD_CONTINUE;}
if			    {return KWD_IF;}
else			{return KWD_ELSE;}
return          {return KWD_RETURN;}
sizeof			{return KWD_SIZEOF;}
switch			{return KWD_SWITCH;}
case			{return KWD_CASE;}
default			{return KWD_DEFAULT;}
"=="			{return EQ;}
"<<"			{return LTLT;}
">>"			{return GTGT;}
"&&"			{return ANDAND;}
"||"			{return OROR;}
"+="			{return PLUSASSIGN;}
"-="			{return MINUSASSIGN;}
"*="			{return TIMESASSIGN;}
"/="			{return DIVASSIGN;}
"++"			{return PLUSPLUS;}
"--"			{return MINUSMINUS;}
\<			    {return LT;}
>			    {return GT;}
"<="			{return LE;}
">="			{return GE;}
"!="			{return NE;}
[a-zA-Z][a-zA-Z0-9_]*	{return IDENTIFIER;}
{INT}           {return INTNUM;}
{NUM}			{return FLOATNUM;}
\"([^\\"\r\n]|(\\.))*\"     {return STRING;}
[ \t]			; /* white space */
\r\n            ;  /* DOS line ending */
\n			    ;  /* Unix line ending */
\r              {yylineno++;}  /* old MacOS line ending */
.			    {return yytext[0];}  /* any other char */
%%

int yywrap () {
	return 1; /* terminate when reaching end of input file */
}
