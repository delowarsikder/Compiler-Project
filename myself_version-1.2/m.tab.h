
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     PRESS = 258,
     AUTO = 259,
     CHECK = 260,
     CHECK_END = 261,
     SHOW = 262,
     ADD = 263,
     SUB = 264,
     MULT = 265,
     DIV = 266,
     GT = 267,
     GTE = 268,
     LT = 269,
     LTE = 270,
     MOD = 271,
     DEQ = 272,
     MATCH = 273,
     EQ = 274,
     NEQ = 275,
     FACT = 276,
     AND = 277,
     OR = 278,
     NOT = 279,
     ENERGY = 280,
     LOOP = 281,
     HEADER_NAME = 282,
     HEADER = 283,
     START = 284,
     END = 285,
     MAIN = 286,
     FROM = 287,
     TO = 288,
     SPLIT = 289,
     REAL = 290,
     COMPLEX = 291,
     SINE = 292,
     COSINE = 293,
     TANGENT = 294,
     LOG = 295,
     NUM = 296,
     BUTTON = 297,
     FLOAT_NUM = 298,
     VAR = 299,
     IFX = 300
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 20 "m.y"

	double double_val;
    int number;
    char *string;



/* Line 1676 of yacc.c  */
#line 105 "m.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


