/* input: 1.1 output: FLT:1.1[3] */
/* input: a output: NOT_RECOGNIZED */
FLT [[:digit:]]+"."[[:digit:]]*
ID [[:alpha:]_][[:alnum:]_]*
KEY if|else|switch|case|while|for
OP [+\-*/]
/* [+-*] dile - ke range detect korbe. tai \- dite hoy  */


%option noyywrap

%%

[ \t\n]     ECHO;
{OP}        fprintf(yyout, "OP:%s[%d]",yytext,yyleng);
{KEY}      fprintf(yyout, "KEY:%s[%d]",yytext,yyleng);
[[:digit:]]+ fprintf(yyout, "INT:%s[%d]",yytext,yyleng);
{FLT}        fprintf(yyout, "FLT:%s[%d]",yytext,yyleng);
{ID}        fprintf(yyout, "ID:%s[%d]",yytext,yyleng);
[^ \t\n]+   fprintf(yyout, "NOT_RECOGNIZED");

%%
int main(int argc, char *argv[])
    {
        yyin = fopen(argv[1],"r");
        yyout = fopen(argv[2],"w");
        yylex();
        return 0;
    }