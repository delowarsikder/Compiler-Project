%{
	
	#include<stdio.h>
	#include<math.h>
	#define pi 3.1416
	#define inf 999
	int sym[52],store[52];
	void yyerror(const char *s);
    int yywrap();  
	int yylex(); 
	int yyparse();
	int checkDeclared(int x);

%}

%union 
{
	double double_val;
    int number;
    char *string;
}

/* Simple grammar rules */
%token  PRESS AUTO CHECK CHECK_END SHOW ADD SUB MULT DIV GT GTE LT LTE MOD DEQ MATCH EQ NEQ FACT AND OR  NOT  ENERGY LOG LOOP HEADER_NAME HEADER START END MAIN FROM TO SPLIT REAL COMPLEX

%token <double_val>SINE COSINE TANGENT
%token <number> NUM
%token <string>BUTTON
%token <double_val>FLOAT_NUM
%token <number>VAR
%nonassoc IFX
%nonassoc CHECK
%left GTE LTE EQ NEQ
%left LT GT
%left MULT DIV

%type <string>stmt
%type <double_val> triangle
%type <number>expression
%type <string>switch click
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
	|switch
	|click
	;

triangle: SINE '(' expression ')' ';' 		{ float a = sin($3); printf("in sin block %s = %d\n",$1,a); }
		|COSINE '(' expression ')' ';' 		{ printf("in cos block %s\n",$1); }
		|TANGENT '(' expression ')' ';' 	{ printf("in tan block %s\n",$1); }
		;

assignment:';' {printf("nothing\n");}
			| VAR EQ expression ';' { int a = checkDeclared($1); 
									if(a) {printf("value of variable %d \n", $3 );}
									else {printf("this variable is not declared\n");}
									}
			;

type: REAL VAR ';' 	{ int a = checkDeclared($2);
					 	if(a==1) {printf("this variable Already declared %d\n",a);}
					  else{sym[$2] = $2;
					  printf("real variable is declared %d\n",$2);
					} 

					  }
	 |COMPLEX VAR ';' { int a = checkDeclared($2);
					 if(a==1){printf("this variable Already declared\n");}
					  else{sym[$2] = $2;} 
					   printf("complex variable is declared %d\n",$2);
					   }
	;
loop: LOOP FROM NUM TO NUM '{' body '}'  {
					// printf("loop execute %d time\n",$5-$3);
					 int i=0;
				   for(i=$3;i<$5;i++){
	  				 printf("loop execute %d time\n",i);
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
		| VAR { $$ = sym[$1]; }
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

switch: BUTTON  expression '{' stmt '}'{
				// $$ = $2;
		printf("switch statement execute\n");
	} 
	;
click: PRESS expression '{' stmt '}' {
	printf("Case execute \n");
		}
		;


%%

int checkDeclared(int x){
	if(sym[x]== x){
		return 1;
	}
	else{
		return 0;
	}
}