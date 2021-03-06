%{
	
	/*
	 
	 *   calculator:   a simple calculator.
	 
	 *   This calculator allows all common arithmetic operations,
	 
	 *   including sin, cos, tan, sqrt, exp, pow, log.
	 
	 *   The calculator is a simple example of using the yacc
	 
	 *   parser generator.
	 
	 *
	 
	 */
	
	#include <stdio.h>
	#include <unistd.h>
	#include <stdlib.h>
	#include <math.h>
	#include <complex.h>
	
	
	#define YYSTYPE double
	
	YYSTYPE last_value = 0;
	
	int lineno;
	long x;
	long Z;
	
	
	extern int yylex(void);
	
	
	
	%}



/*
 
 * Define the tokens produced by yylex()
 
 */

%token NUMBER

%token LAST

%left '+' '-'

%left '*' '/'

%left '^'

%left NEGATIVE

%left COS EXP SIN SQRT TAN Z EQL ABS




/*
 
 *  Begin specification of the parser.
 
 */

%%

/*
 
 * a 'list' may be empty, contain blank lines or expressions.
 
 */

list:

|    list '\n'

|    list expr '\n'           { printf("%.8g\n",last_value=$2);
	
}

; /*
   
   * Expressions are defined recursively as strings of terms
   
   * and expressions. Note that the 'sin',... functions do not
   
   * require bracketed parameters although sin x +1 is
   
   * interpreted as (sin(x))+1
   
   */



expr:     term                 { $$ = $1;         }

|     expr '+' expr            { $$ = $1 + $3;    }

|     expr '-' expr            { $$ = $1 - $3;    }

|     expr '*' expr            { $$ = $1 * $3;    }

|     expr '/' expr            { $$ = $1 / $3;    }

|     expr '^' expr            { $$ = pow($1,$3); }

|     '-' expr  %prec NEGATIVE { $$ = - $2;       }

|     COS   term               { $$ = cos($2);    }

|     EXP   term               { $$ = exp($2);    }

|     SIN   term               { $$ = sin($2);    }

|     SQRT  term               { $$ = sqrt($2);   }

|     TAN   term               { $$ = tan($2);    }

| Z term { $$ = z($2);}

| EQL term { $$ = eql($2);}

| ABS term { $$ = fabs($2);}

;

/*
 
 * The following are of the highest precedence.
 
 * They needed to be distinguished to allow the
 
 * functions (sin...) to operate properly without
 
 * parentheses
 
 */

term:     NUMBER                   { $$ = $1;         }

|     LAST                     { $$ = last_value; }

|     '(' expr ')'             { $$ = $2;         }

;

%%



#include <stdlib.h>

#include <string.h>

#include <unistd.h>


char *fname = "-stdin-";

int eql(int val)
{
	return 0;
}

int yywrap(int val)
{
	return 0;
}

void yyerror (char const *s)
{
	fprintf (stderr, "%s\n", s);
}

main()

{
	
	yyparse();
	
	return 0;
	
}
