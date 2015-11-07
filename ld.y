%{
	#include<stdio.h>
	#include<stdlib.h>
	//#include<bits/stdc++.h>
	extern int yylex();
	void yyerror(char *);
	//void add(string s);
	int var;
	//vector<string> a;
%}

%union {
	float f;
}

%start S
%token <f> NUM
%token print
%type <f> E T F

%%

S : E { /*add("S -> E\n");*/ var = 0; }
  | print { /*printf("%s",a[0].c_str);*/ }
  ;
E : E '+' T { /*a.push_back("E -> E + T\n");*/ }
  | E '-' T { /*a.push_back("E -> E - T\n");*/ }
  | T { /*a.push_back("E -> T\n");*/ }
  ;
T : T '*' F { /*a.push_back("T -> T * F\n");*/ } 
  | T '/' F { /*a.push_back("T -> T / F\n");*/ } 
  | F { /*a.push_back("T -> F\n");*/ }
  ;

F : '(' E ')' { /*a.push_back("F -> (E)\n");*/ }
  | '-' F { /*a.push_back("F -> -F\n");*/ }
  | NUM { /*a.push_back("F -> id\n");*/ }
  ;

%%

void yyerror(char *msg) {
	//return 1;
}

//void add(string s) {
//	a.push_back(s);
//}

int main() {
	yyparse();
	//printf("yo\n");
}
