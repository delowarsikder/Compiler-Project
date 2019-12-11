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


[0-9]+                          { yylval.number = atof(yytext);  return NUM;}
[0-9]+"."[0-9]+                 { yylval.double_val = atof(yytext); return FLOAT_NUM;}

[a-z] {
 yylval.number = *yytext - 'a';
 return VAR;
 }

"main"       {  return MAIN;}
"start"      {  return START;}
"end"        {  return END;}
"button"     {  return BUTTON;}
"press"      {  return PRESS;}
"auto"       {  return AUTO;}
"check"      {  return CHECK;}
"check_end"  {  return CHECK_END;}
"show"       {  return SHOW;}
"add"        {  return ADD;}
"sub"        {  return SUB;}
"mult"       {  return MULT;}
"div"        {  return DIV;}
"gt"         {  return GT;}
"gte"        {  return GTE;}
"lt"         {  return LT;}
"lte"        {  return LTE;}
"mod"        {  return MOD;}
"match"      {  return MATCH;}
"eq"         {  return EQ;}
"neq"        {  return NEQ;}
"fact"       {  return FACT;}
"and"        {  return AND;}
"or"         {  return OR;}            
"not"        {  return NOT;}
"energy"     {  return ENERGY;}
"log"        {  yylval.string=yytext; return LOG;}
"sine"       {  yylval.string=yytext; return SINE;}
"cosine"     {  yylval.string=yytext; return COSINE;}
"tangent"    {  yylval.string=yytext; return TANGENT;}
"loop"       {  return LOOP;}
"split"      {  return SPLIT;}
"header"     {  return HEADER;}
"from"       {  return FROM;}
"to"         {  return TO;}
"real"       {  return REAL;}
"complex"    {  return COMPLEX;}

[-+/*<>,();%${}@^] {
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