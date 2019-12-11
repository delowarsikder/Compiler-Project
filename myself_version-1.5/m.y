%{
	#include<stdio.h>
	#include<math.h>
	#define pi 3.1416
	#define inf 999
	int sym[52]={0},store[52]={0};
	int state[10]={0};
	int declared[52]= {0};
	void yyerror(const char *s);
    int yywrap();  
	int yylex(); 
	int yyparse();
	int checkDeclared(int x);
	int checkState(int m);

%}


%union 
{
	double double_val;
    int number;
    char *string;
}


/* Simple grammar rules */
%token  CHECK CHECK_END SHOW ADD SUB MULT DIV GT GTE LT LTE MOD DEQ MATCH EQ NEQ FACT AND OR  NOT  ENERGY LOOP HEADER_NAME HEADER START END MAIN FROM TO SPLIT REAL COMPLEX

%token <number>SINE COSINE TANGENT LOG
%token <number> NUM
%token <number>BUTTON PRESS AUTO
%token <double_val>FLOAT_NUM
%token <number>VAR
%nonassoc IFX
%nonassoc CHECK
%left GTE LTE EQ NEQ
%left LT GT
%left MULT DIV

%type<number>print
%type <number>stmt
%type <double_val> triangle
%type <number>expression
%type <number>switch click
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
	|function
	|equation
	|print
	;

triangle:SINE '(' expression ')' ';' 		{ $$ = sin(($3*pi)/180); printf("in sin block %s = %lf\n",$1,$$); }
		|COSINE '(' expression ')' ';' 		{ $$ = cos(($3*pi)/180); printf("in cos block %s = %lf\n",$1,$$); }
		|TANGENT '('expression ')' ';' 		{ $$ = tan(($3*pi)/180); printf("in tan block %s = %lf\n",$1,a); }
		|LOG '('expression ')' ';' 			{ $$ = log($3); printf("in log block %s =%lf\n",$1,$$); }
		;
assignment:';' {printf("nothing\n");}
			| VAR EQ expression ';' { if(declared[$1]) {
									sym[$1] = $3; printf("value of variable %c = %d\n",$1+'a', sym[$1]);
									}
									else {printf("this variable is not declared\n");}
									}
			;

type: REAL VAR ';' 	{ if(declared[$2]) { printf("real already declared = %c\n",$2+'a');}
					 	else{	declared[$2] = 1; }					  
					} 
	 |COMPLEX VAR ';' { 
		 			if(declared[$2]) { printf("complex already declared = %c\n",$2+'a');}
					 	else{ declared[$2] = 1; }
					   }
	;
loop: LOOP FROM NUM TO NUM '{' body '}'  {
					printf("loop execute %d time\n",$5-$3+1);
					 int i=0;
				   for(i=$3;i<$5;i++){
	  				//  printf("loop execute %d time\n",i);
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
		| VAR { if(!declared[$1]){
							printf("%c variable not declared\n",$1+'a');
				}
				else { $$ = sym[$1]; }						
			}
		| expression '+' expression { $$ = $1 + $3; }
		| expression SUB expression { $$ = $1 - $3; }
		| expression '*' expression { $$ = $1 * $3; }
		| expression '/' expression { if( $3 ){ $$ = $1 / $3; }
					else
					{ $$ = 0;	printf("\ndivided by zero \n"); } }		
		| expression '<' expression { $$ = $1 < $3; }
		| expression '>' expression {  $$ = $1 > $3; }
		| '('expression')' { $$ = $2; }
		;

equation: expression '=' expression ';' {
						if(declared[$1]){
						 printf("value of %c = %d\n",$1+'a',$3);
						 }
					 	else{
							  printf("variable %c is not declared \n",$1+'a'); 
							  }
				}
				|expression '=' triangle {  if(!declared[$1]){printf("%c variable not declared\n",$1+'a');}
										else{ sym[$1] = $3 ; printf ("value of %c = %lf\n",$1+'a',$3); } 
				}
			;

switch: BUTTON  expression '{' click '}'{
				state[$2] = $2;
		printf("value of state %d : %d\n",state[$2],$2);
	} 
	;
click: PRESS expression '{' stmt SPLIT'}' {		
		printf("case expression 1 state %d : %d\n",$2,state[$2]);		
		}
		|PRESS expression '{' stmt SPLIT'}' click {
		printf("case expression2: %d\n",$2);
		}
		|PRESS expression '{' stmt SPLIT'}' auto {
		printf("auto expression with : %d\n",$2);
		}
		;

auto: AUTO '{' stmt '}'{printf("auto expresstion2: %d\n",$3);}
		;

function : ENERGY '(' expression '^' expression ')' ';'
			{ int a = pow($3,$5);
			 printf("value = %d\n",a);
			}
			; 

print : SHOW '(' expression ')' ';' { if(!declared[$3]){printf("%c variable not declared\n",$3+'a'); }
								else{
								printf("print block %c = %lf\n",$3+'a',sym[$3]);
									}
			}
		;

%%
/*
int checkState(int m){
	if(state[m]==m){
		return 1;
	}
	else{
		return 0;
	}
}


int checkDeclared(int x){
	if(sym[x]== x){
		return 1;
	}
	else{
		return 0;
	}
}*/