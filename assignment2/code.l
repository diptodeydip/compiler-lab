%{

#include "y.tab.h"

%}

%%

1       {return ONE;}

0       {return ZERO;}


[\n"."]    {return yytext[0];}
    
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
