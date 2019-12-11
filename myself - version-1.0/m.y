%{
	#include<stdio.h>
	#include<math.h>
	int sym[52],store[26];
	void yyerror(const char *s);
    int yywrap();  
	int yylex(); 
	int yyparse();

%}

%union 
{
	double double_val;
    int number;
    char *string;
}

/* Simple grammar rules */
%token BUTTON STATE AUTO CHECK CHECK_END SHOW ADD SUB MULT DIV GT GTE LT LTE MOD DEQ MATCH EQ NEQ FACT AND OR  NOT  ENERGY LOG LOOP HEADER_NAME HEADER START END MAIN FROM TO SPLIT REAL COMPLEX

%token <string>SINE COSINE TANGENT
%token <number> NUM
%token <double_val>FLOAT_NUM
%token <number>VAR
%nonassoc IFX
%nonassoc CHECK
%left GTE LTE EQ NEQ
%left LT GT
%left MULT DIV
%type <double_val> triangle
%type <number>expression
%start begin

%%

begin: headers main
;

headers:'@' HEADER HEADER_NAME
		|'@' HEADER HEADER_NAME headers
		;

main:START MAIN body END MAIN
	;

body:stmt 
	|stmt body
	;

stmt:/*null*/ 
	|loop
	|condition
	|expression
	|triangle
	|assignment
	|type
	;

triangle: SINE '(' expression ')' ';' {printf("in sin block %s(%d) \n",$1,$3);}
		|COSINE '(' expression ')' ';' {printf("in cos block %s(%d) \n",$1,$3);}
		|TANGENT '(' expression ')' ';' {printf("in tan block %s(%d) \n",$1,$3);}
		;

assignment:';' {printf("nothing\n");}
			| VAR EQ expression ';' { sym[$1] = $3; 
									printf("value of the variable :%d\n",$3);}
			;

type: REAL VAR ';' 	{ printf("real variable is declared %d\n",$2);}
	 |COMPLEX VAR ';' { printf("complex variable is declared %d\n",$2);}
	;
loop: LOOP FROM NUM TO NUM '{' body '}'  {
					printf("loop execute %d time\n",$5-$3);
					 int i=0;
				   for(i=$3;i<$5;i++){
	  				 //printf("for loop statement\n");
	 	  }
			
	}
			;

condition: CHECK '(' expression')' expression ';'{
												if($3){
													printf("value of expression in if :%d\n", $5);
													}
												else
												{
										printf("conditon value zero in if block\n");
										}
									}

			| CHECK '(' expression')' expression ';' CHECK_END expression ';' {
										if($3){
											printf("value of expression in if :%d\n",$5);}
										else{
											printf("value of expression in else :%d\n",$8);}
										} 
		;


expression: NUM { $$ = $1;}
		| VAR { $$ = sym[ $1 ]; }
		| expression '+' expression { $$ = $1 + $3; }
		| expression '-' expression { $$ = $1 - $3; }
		| expression '*' expression { $$ = $1 * $3; }
		| expression '/' expression { if( $3 ){ $$ = $1 / $3; }
					else
					{ $$ = 0;	printf("\ndivided by zero \n"); } }		
		| expression '<' expression { $$ = $1 < $3; }
		| expression '>' expression { $$ = $1 > $3; }
		| '('expression')' { $$ = $2; }
		;


%%