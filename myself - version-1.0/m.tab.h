
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
     BUTTON = 258,
     STATE = 259,
     AUTO = 260,
     CHECK = 261,
     CHECK_END = 262,
     SHOW = 263,
     ADD = 264,
     SUB = 265,
     MULT = 266,
     DIV = 267,
     GT = 268,
     GTE = 269,
     LT = 270,
     LTE = 271,
     MOD = 272,
     DEQ = 273,
     MATCH = 274,
     EQ = 275,
     NEQ = 276,
     FACT = 277,
     AND = 278,
     OR = 279,
     NOT = 280,
     ENERGY = 281,
     LOG = 282,
     LOOP = 283,
     HEADER_NAME = 284,
     HEADER = 285,
     START = 286,
     END = 287,
     MAIN = 288,
     FROM = 289,
     TO = 290,
     SPLIT = 291,
     REAL = 292,
     COMPLEX = 293,
     SINE = 294,
     COSINE = 295,
     TANGENT = 296,
     NUM = 297,
     FLOAT_NUM = 298,
     VAR = 299,
     IFX = 300
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 13 "m.y"

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


