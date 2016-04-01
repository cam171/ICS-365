%{
	
	/*
	 
	 * Sample lexical analyzer for a simple calculator.
	 
	 * Edited by: Camellia Kalra,Hewan Redie, Jean Vang
	 
	 * ICS 365 Spring 2016
	 
	 * Extra Credit: Parser
	 
	 * Compile Instructions:
	 * lex lexer.l
	 * yacc -d example.y
	 * cc lex.yy.c y.tab.c -o example
	 * cc lex.yy.c -ll
	 
	 * To Run:
	 * a.out < wordfile.txt
	 
	 * SOURCE CODE FROM:
	 
	 * http://www.esrl.noaa.gov/gmd/dv/hats/cats/stations/qnxman/lex.html
	 
	 * Edited to add: ABS, EQL, and Z
	 
	 */
	
	#include <stdio.h>
	#include <unistd.h>
	#include <stdlib.h>
	#include <math.h>
	#include <complex.h>
	#include "y.tab.h"
	
	#define double complex z = I
	
	extern int lineno;        /* current line number  */
	extern YYSTYPE yylval;    /* value of numeric token */
	extern int x;
	
	
	
	
%}



digit [0-9]

space [ \t]



%%


{space}         { ; }    /* spaces are ignored */



{digit}+\.?|{digit}*\.{digit}+ {
	
	yylval = strtod(yytext,0);
	
	return NUMBER; }



\*\*            { return '^';  }

last_value			{return LAST; } //how to define "last"?

cos             { return COS;  }

exp             { return EXP;  }

sin             { return SIN;  }

sqrt            { return SQRT; }

tan             { return TAN;  }

fabs			{ return ABS; }

eql				{ yylval = sqrt(3)/4*(x*x);
	return EQL; }

z				{ yylval = I;
	return Z;}

pi              { yylval = atan(1.0)*4;
	
	return NUMBER; }

e               { yylval = exp(1.0);
	
	return NUMBER; }

\n              { lineno++; return '\n'; }



.               { return yytext[0]; }



%%