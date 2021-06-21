%{/*Declarations */
#include <stdio.h>
#include <math.h>
int yylex(void);
void yyerror(char *);
%}

%union{

    struct s1{
        float len;
        float val;
    }st;
 
}

%token ONE ZERO
%start program
%type <st> L program statement B

%%


program:  program statement '\n' {printf("%f\n",$2.val);}
    |
    ;

statement:  L '.' L {$$.val = $1.val + $3.val/pow(2,$3.len);}
    | L    {$$.val = $1.val;}
    ;

L:  L B {   $$.val = ($1.val*2)+$2.val;
             $$.len = $1.len + $2.len;
             }
    | B {   $$.val = $1.val; 
            $$.len = $1.len;
            }
    ;
B:  ZERO {$$.val = 0; $$.len = 1;}
    | ONE {$$.val = 1; $$.len = 1;}
    ;

%%

void yyerror(char *s) { /* User Subroutines */
fprintf(stderr, "%s\n",s);
}

int main(void) {
yyparse();
return 0;
}
