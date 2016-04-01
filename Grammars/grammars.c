//
//  grammars.c
//
//	grammar3_2
//
//  Created by Camellia Kalra on 2/19/16.
//
//

#include "grammars.h"
#include <string.h>
#include <stdlib.h>

String string;
int indx;
long length;


char * readString()
{
    char * buffer;
    buffer = (char *)malloc(200);
    fgets(buffer, 200,stdin);
    return buffer;
}

void removeSpecialCharacters(char * source)

{
    int i=0;
    int j=0;
    
    while(source[j] !=0) {
        
        source[i] = source[j];
        
        j = j+1;
        
        if (source[i] != ' ' && source[i] != '\n' && source[i] != '\r')
            
            i = i+1;
        
    }
    source[i] = 0;
}


// everything seperated by whitespace.
// grammar from 3.2

void yoink(String _string)
{
    string = _string;
    indx = 0;
    removeSpecialCharacters(string); // was string;
    length = strlen(string);
}


boolean assign() {
    
    if(!peekId(0))
        return false;
    
    consumeId();
    
    if(!peekEquals(indx))
        return false;
    consumeEquals();
    
    
	if (!expr())
        return false;
    
    //printf("indx: "+indx+" sizeof:"+string.length);
    
    if (indx !=length)
    {
        printf("\nDidn't consume all the tokens, don't know where to go\n");
        return false;
    }
    
    return true;
}

boolean peekId(int indx) {
    boolean retVal = false;
    char token = string[indx];
    
    switch(token) {
        case 'A': retVal = true;
            break;
        case 'B': retVal = true;
            break;
        case 'C': retVal = true;
            break;
    }
    
    return retVal;
}

void consumeId()
{
    printf("%c \n",string[indx]);
    indx++;
}

boolean peekEquals(int indx) {
    boolean retVal = false;
    if (string[indx] == '=')
        retVal= true;
    
    return retVal;
}

void consumeEquals() {
    printf("%c \n", string[indx]);
    indx++;
}



boolean peekPlus(int indx) {
    
    boolean retVal = false;
    if (indx >= length)
        return false;
    
    if (string[indx]=='+')
        retVal= true;
    return retVal;
}

void consumePlus() {
    printf(string[indx]+"  ");
    indx++;
}

boolean peekMultiply(int indx) {
    
    boolean retVal = false;
    
    if (indx >= length)
        return false;
    
    if (string[indx]=='*')
        retVal= true;
    return retVal;
}

void consumeMultiply() {
    printf(string[indx]+"  ");
    indx++;
}


boolean peekLeftParenthesis(int indx)  {
    
    boolean retVal = false;
    if (indx >= length)
        return false;
    
    if (string[indx]=='(')
        retVal= true;
    return retVal;
}

void consumeLeftParenthesis() {
    printf(string[indx]+"  ");
    indx++;
}

boolean peekRightParenthesis(int indx) {
    boolean retVal = false;
    if (string[indx]==')')
        retVal= true;
    return retVal;
}

void consumeRightParenthesis() {
    printf(string[indx]+"  ");
    indx++;
}


boolean expr() {
    
    if (peekId(indx))
    {
        consumeId();
        if (peekPlus(indx)) {
            consumePlus();
            if (expr())
                return true;
            return
            false;
        }
        
        if (peekMultiply(indx)) {
            consumeMultiply();
            if (expr())
                return true;
            else
                return false;
        }
        else
        {
            return true;
        }
        
    }
    
    if (peekLeftParenthesis(indx)) {
        consumeLeftParenthesis();
        if (expr()) {
            if (peekRightParenthesis(indx)) {
                consumeRightParenthesis();
                return true;
            }
            
        }
        return false;
    }
    
    return false;
}

void parse() {
    if (assign())
        printf("\nWorks\n");
    else
        printf("\nDidn't work\n");
}

void mymain() {
	String yoinkString;
	yoinkString = (char *)malloc(100);
	memcpy(yoinkString,"A = A * ( B + ( C * A ) )",
		   strlen("A = A * ( B + ( C * A ) )"));
	yoink(yoinkString);
	parse();
	
}

