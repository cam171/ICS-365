//
//  grammars.h
//
//
//  Created by Camellia Kalra on 2/19/16.
//
//

#ifndef grammars_h
#define grammars_h

#include <stdio.h>
#include <string.h>

typedef int boolean;
#define false 0
#define true 1
typedef char * String;

void consumeId();
boolean peekEquals(int indx);
void consumeEquals();
void mymain();
boolean peekId(int indx);

struct sizez{
	size_t length;
	int * elements;
};

//global array declaration
extern char strings[100];

#endif /* grammars_h */
