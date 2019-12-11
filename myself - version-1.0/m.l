%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "m.tab.h"
    extern YYSTYPE yylval;
    void yyerror(const char *s);
    int yywrap();  
	int yylex();  
    int yyparse();
%}


%%


[0-9]+                          { yylval.number = atof(yytext); printf("number\n"); return NUM;}
[0-9]+"."[0-9]+                 { yylval.double_val = atof(yytext); printf("floating value\n"); return FLOAT_NUM;}

[a-z] {
 yylval.number = *yytext - 'a';
 return VAR;
 }


"main"       { printf("main function \n"); return MAIN;}
"start"      {  printf("start "); return START;}
"end"        {  printf("end "); return END;}
"button"     {  printf("switching\n"); return BUTTON;}
"state"      {  printf("case\n"); return STATE;}
"auto"       {  printf("Default\n"); return AUTO;}
"check"      {  printf("if\n"); return CHECK;}
"check_end"  {  printf("else\n"); return CHECK_END;}
"show"       {  printf("printf\n"); return SHOW;}
"add"        {  printf("summation \n"); return ADD;}
"sub"        {  printf("subtraction \n"); return SUB;}
"mult"       {  printf("multiplication\n"); return MULT;}
"div"        {  printf("division\n"); return DIV;}
"gt"         {  printf("greater than\n"); return GT;}
"gte"        {  printf("greater than equal\n"); return GTE;}
"lt"         {  printf("less than\n"); return LT;}
"lte"        {  printf("less than equal\n"); return LTE;}
"mod"        {  printf("modulus\n"); return MOD;}
"match"      {  printf("Double equal \n"); return MATCH;}
"eq"         {  printf("equal\n"); return EQ;}
"neq"        {  printf("not equal\n"); return NEQ;}
"fact"       {  printf("factorial\n"); return FACT;}
"and"        {  printf("and\n"); return AND;}
"or"         {  printf("or\n"); return OR;}            
"not"        {  printf("not\n"); return NOT;}
"energy"     {  printf("power\n"); return ENERGY;}
"log"        {  printf("log\n"); return LOG;}
"sine"       {  printf("sin\n"); yylval.string=yytext; return SINE;}
"cosine"    {  printf("cos\n");yylval.string=yytext; return COSINE;}
"tangent"    {  printf("tan\n");yylval.string=yytext; return TANGENT;}
"loop"       {  printf("loop\n"); return LOOP;}
"split"      {  printf("break\n"); return SPLIT;}
"header"     {  return HEADER;}
"from"       {  return FROM;}
"to"         {  return TO;}
"real"       {  return REAL;}
"complex"    {  return COMPLEX;}

[-+/*<>,();%${}@] {
    yylval.number = yytext[0];
    return *yytext;
}

[a-zA-Z][a-zA-Z0-9]*[$]  {printf("include %s header\n",yytext); return HEADER_NAME;}

[ \t\n]*	{;}

.	{
		yyerror("Unknown Character.\n");
	}

%%


int yywrap(){
    return 1;
}

void yyerror(const char *msg){
    printf("ParseError: %s\n", msg);
}

int main(){
    yyin = freopen("input.txt","r",stdin);
	yyout = freopen("output.txt","w",stdout);
    yyparse();
}