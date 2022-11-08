#include "stdio.h"
#include "stdlib.h"

char* concatenate(char s1[], char s2[]);

int main()
{
	char s1[3] = "hi";
	char s2[6] = "there";
	char* p = NULL;

	p = concatenate(s1, s2);
	printf("%s\n", p);  // Should print hithere

	free(p);
}

char* concatenate(char s1[], char s2[])
{
	// determine the length of c-strings s1 and s2
  int i,len_s1,j,len_s2,k,l;
  for(i=0;s1[i]!='\0';i++)
  len_s1 = i;
  for(j=0;s2[j]!='\0';j++)
  len_s2 = j;
  
	// use malloc() to allocate enough memory to hold the
	// concatenation of s1 and s2 (don't forget about
	// the extra byte required for the null terminator '\0')
  char* strConc;
  strConc = (char *) malloc(2*(len_s1+len_s2));
	// in the newly allocated memory, create the c-string that
	// concatenates s1 and s2
  for(k=0;s1[k]!='\0';k++){
    strConc[k] = s1[k];
  }

  for(l=0;s2[l]!='\0';l++){
    strConc[k+l] = s2[l];
  }
	// return a char* that points to the first character in
	// the concatenated string
  return strConc;
}
