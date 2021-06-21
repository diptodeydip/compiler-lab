%{/*Declarations */
#include <stdio.h>
#include <math.h>
int yylex(void);
void yyerror(char *);
int typeFlag=0; /* if 0 then int and if 1 then float */

%}

%union {char id;} 
%token floatType intType
%token <id> ID
%start program

%%

program:  program S '\n' {
                                printf("\n");
                        }
        |
        ;

S:   S ';' S
            |   dataType var   
            ;

dataType:   floatType   {typeFlag = 1;}
        | intType   {typeFlag = 0;}
        ;

var:     var ',' var
        | ID    {
                    if( typeFlag == 1)
                        printf("%c(float), ", $1);
                    else
                        printf("%c(int), ", $1);
                }
        ;   


%%

void yyerror(char *s) { /* User Subroutines */
fprintf(stderr, "%s\n",s);
}

int main(void) {
yyparse();
return 0;
}
