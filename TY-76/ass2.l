%{
#include<stdio.h>
int charcount = 0;
int wordcount = 0;
int linecount = 0;
int sencount = 0;
int vowelcount = 0;
int max_word_length = 0;
int const_count=0;
int digitcount = 0;

%}

%%
[aeiouAEIOU] {vowelcount++; }

\n { linecount++; charcount++; }           // For counting lines
[\t]+ { charcount += yyleng; }             // For counting spaces/tabs
[^ \t\n]+ { wordcount++; charcount += yyleng; }  // For counting words
[0-9 ] {digitcount++;charcount++; }
%%

int yywrap()
{
    return 1;  // End of file handler
}

int main()
{
    yyin = fopen("text.txt", "r");  // Open the file
   
    yylex();  // Start lexing the file

    // Print the results
    printf("\nNumber of lines: %d", linecount);
    printf("\nNumber of Characters: %d", charcount);
    printf("\nNumber of words: %d", wordcount);
    printf("\nNumber of digits: %d", digitcount);
    printf("\nNumber of vowels: %d",vowelcount);    
   
    printf("\n");

    return 0;
}

