%{

#include "y.tab.h"

%}

%%

float       return floatType;

int         return intType;

[a-zA-Z]   {
            yylval.id = yytext[0];
            return ID;
        }

[;,\n]    {return yytext[0];}
    
[ \t]   /* skip whitespaces */ 

    /* undefined */
.   {
        ECHO;
        yyerror("invalid character");
    }



%%

int yywrap (void )
{
    return 1;
}