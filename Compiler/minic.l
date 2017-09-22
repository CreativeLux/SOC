digit		([0-9])|([1-9][0-9]*)
letter		[a-zA-Z]
id          {letter}({letter}|{digit})*
num         {digit}[1-9]*
hex         0(x|X)({letter}|[0-9])*

%{
#include "y.tab.h"
#include "definition.h"
extern YYSTYPE yylval;
int totalError = 0;
%}

%%
"void"          { yylval.Sval.text = strdup(yytext); yylval.Sval.type = VOID; return(VOID); }
"continue"      { yylval.Sval.text = strdup(yytext); yylval.Sval.type = CONTINUE; return(CONTINUE);}
"if"            { yylval.Sval.text = strdup(yytext); yylval.Sval.type = IF; return(IF); }
"while"         { yylval.Sval.text = strdup(yytext); yylval.Sval.type = WHILE; return(WHILE); }
"else"          { yylval.Sval.text = strdup(yytext); yylval.Sval.type = ELSE; return(ELSE); }
"break"         { yylval.Sval.text = strdup(yytext); yylval.Sval.type = BREAK; return(BREAK); }
"int"           { yylval.Sval.text = strdup(yytext); yylval.Sval.type = INT; return(INT); }
"return"        { yylval.Sval.text = strdup(yytext); yylval.Sval.type = RETURN; return(RETURN); }
"||"            { yylval.Sval.text = strdup(yytext); yylval.Sval.type = OR; return(OR); }
"&&"            { yylval.Sval.text = strdup(yytext); yylval.Sval.type = AND; return(AND); }
{id}            { yylval.Sval.text = strdup(yytext); yylval.Sval.type = IDENT; return(IDENT); }
{hex}           { yylval.Sval.text = strdup(yytext); yylval.Sval.type = HEXNUM; return(HEXNUM); }
{num}           { yylval.Sval.text = strdup(yytext); yylval.Sval.type = DECNUM; return(DECNUM); }
"<="            { yylval.Sval.text = strdup(yytext); yylval.Sval.type = LE; return(LE); }
">="            { yylval.Sval.text = strdup(yytext); yylval.Sval.type = GE; return(GE); }
"=="            { yylval.Sval.text = strdup(yytext); yylval.Sval.type = EQ; return(EQ); }
"!="            { yylval.Sval.text = strdup(yytext); yylval.Sval.type = NE; return(NE); }
">"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('>'); }
"<"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('<'); }
","             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return(','); }
";"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return(';'); }
"{"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('{'); }
"}"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('}'); }
"%"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('%'); }
"*"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('*'); }
"/"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('/'); }
"="             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('='); }
"("             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('('); }
")"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return(')'); }
"~"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('~'); }
"&"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('&'); }
"^"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('^'); }
"["             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('['); }
"]"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return(']'); }
"<<"            { yylval.Sval.text = strdup(yytext); yylval.Sval.type = LSHIFT; return(LSHIFT); }
">>"            { yylval.Sval.text = strdup(yytext); yylval.Sval.type = RSHIFT; return(RSHIFT); }
"|"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('|'); }
[ \t\v\f]       { }
\n              { yylineno++; }
\r              { yylineno++; }
"$"             { yylval.Sval.text = strdup(yytext); yylval.Sval.type = -1; return('$'); }
"/*"            { comment(); }
"//"            { comment2(); }
.               { lexerror(); }
%%

yywrap()
{
	if (totalError > 0)
        printf("Total count of lexical error: %d\n", totalError);
    return(1);
}

// 处理/* */型的注释
comment()
{
	char c, c1;
	c=input();
	while(1){
		c1 = input();
        if (c == '*' && c1 == '/')
            break;
        else if (c == '\n')
            yylineno++;
		c=c1;
	}
}

// 处理//型的注释
comment2()
{
	char c;
	while ((c = input()) != '\n');
    yylineno++;
}

// 错误处理
lexerror()
{
    printf("Lexical error: invalid '%s' at line %d\n", yytext, yylineno);
    totalError++;
}
