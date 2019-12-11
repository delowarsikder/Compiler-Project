
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
     CHECK = 258,
     CHECK_END = 259,
     ADD = 260,
     SUB = 261,
     MULT = 262,
     DIV = 263,
     GT = 264,
     GTE = 265,
     LT = 266,
     LTE = 267,
     MOD = 268,
     DEQ = 269,
     MATCH = 270,
     EQ = 271,
     NEQ = 272,
     FACT = 273,
     AND = 274,
     OR = 275,
     NOT = 276,
     ENERGY = 277,
     LOOP = 278,
     HEADER_NAME = 279,
     HEADER = 280,
     START = 281,
     END = 282,
     MAIN = 283,
     FROM = 284,
     TO = 285,
     SPLIT = 286,
     REAL = 287,
     COMPLEX = 288,
     SINE = 289,
     COSINE = 290,
     TANGENT = 291,
     LOG = 292,
     NUM = 293,
     BUTTON = 294,
     PRESS = 295,
     AUTO = 296,
     FLOAT_NUM = 297,
     VAR = 298,
     SHOW = 299,
     IFX = 300
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 22 "m.y"

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


