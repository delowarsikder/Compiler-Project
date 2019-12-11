%{
	#include<stdio.h>
	#include<math.h>
	#define pi 3.1416
	#define inf 999
	void yyerror(const char *s);
    int yywrap();  
	int yylex(); 
	int yyparse();
	int checkDeclared(int x);
	int checkState(int m);

	double sym[52]={0};
	int store[52]={0};
	int state[10]={0};
	int declared[52]= {0};
	int swvalue=0,check=0;
%}


%union 
{
	double double_val;
    int number;
    char *string;
}


/* Simple grammar rules */
%token  CHECK CHECK_END ADD SUB MULT DIV GT GTE LT LTE MOD DEQ MATCH EQ NEQ FACT AND OR  NOT  ENERGY LOOP HEADER_NAME HEADER START END MAIN FROM TO SPLIT REAL COMPLEX

%token <number>SINE COSINE TANGENT LOG
%token <number> NUM 
%token <number>BUTTON PRESS AUTO
%token <double_val>FLOAT_NUM
%token <number>VAR
%token<string>SHOW

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

triangle:
		SINE '(' expression ')' ';' 		{ $$ = sin(($3*pi)/180); printf("in sin block %s = %lf\n",$1,$$); }
		|COSINE '(' expression ')' ';' 		{ $$ = cos(($3*pi)/180); printf("in cos block %s = %lf\n",$1,$$); }
		|TANGENT '('expression ')' ';' 		{ $$ = tan(($3*pi)/180); printf("in tan block %s = %lf\n",$1,$$); }
		|LOG '('expression ')' ';' 			{ $$ = log($3); printf("in log block %s =%lf\n",$1,$$); }
		;

assignment:
			';' { printf("nothing\n"); }
			| VAR EQ expression ';' { if(declared[$1]) {
									sym[$1] = $3; printf("assign value of variable %c = %lf\n",$1+'a', sym[$1]);
									}
									else {printf("%c variable is not declared\n",$1+'a');}
									}
		;

type:
	 REAL VAR ';' 	{ if(declared[$2]) { printf("real already declared = %c\n",$2+'a');}
					 	else{	declared[$2] = 1; }					  
					} 

	 |COMPLEX VAR ';' { 
		 			if(declared[$2]) { printf("complex already declared = %c\n",$2+'a');}
					 	else{ declared[$2] = 1; }
					   }
	;

loop:
	LOOP FROM NUM TO NUM '{' expression ';' '}'  {
					// printf("loop execute %d time\n",$5-$3+1);
					 int i=0;
				   for(i=$3;i<=$5;i++){
	  				//  printf("loop execute %d time = %d\n",i,$7);
					}
	}
	;

expression:
		NUM { $$ = $1;}
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

equation:
		VAR '=' expression ';' {
						if(declared[$1]){
						sym[$1] = $3 ;
						 printf("value of %c = %lf\n",$1+'a',sym[$1]);
						 }
					 	else{
							  printf("variable %c is not declared \n",$1+'a'); 
							  }
				}
		|VAR '=' triangle { 
					 	if(!declared[$1])
					 	{ printf("%c variable not declared\n",$1+'a');}								
						else{
							 sym[$1] = $3 ; printf ("triangle value of %c = %lf\n",$1+'a',sym[$1]);
						 } 
		}
		;

switch:
		BUTTON  NUM '{'  {
			swvalue = $2;
				// state[$2] = $2;
		printf("switch exprssion value : %d\n",$2);
	} 
	| click '}'
	;

;

click:/*null*/
		|
		PRESS NUM '{' expression SPLIT'}' click {
		if(!check){
			if(swvalue == $2){
				printf("case expression : %d value = %d\n",$2,$4);
				check = 1;
		}
		}
		else {
			//  printf("not match %d\n",$2);
		 }
		}
		|auto 
		;

auto:
	AUTO '{' expression '}'{ 
		if(!check){
			   printf("auto expresstion2: %d\n",$3);
				check = 1;
		}
		
		   }
		;

function: 
		ENERGY '(' expression '^' expression ')' ';'
			{ int a = pow($3,$5);
			 printf("functional value = %d\n",a);
			}
			; 
print:
	SHOW '(' VAR ')' ';' {
						if(!declared[$3])
					 	{ 
						 printf("%c variable not declared\n",$1+'a');
						}
							 
						else{
							printf("print block %c = %lf\n",$3+'a',sym[$3]);		
							}
	}
	;

condition:
		CHECK '(' expression')' expression ';'{
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