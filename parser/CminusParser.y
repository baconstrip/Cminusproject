/*******************************************************/
/*                     Cminus Parser                   */
/*                                                     */
/*******************************************************/

/*********************DEFINITIONS***********************/
%{
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <strings.h>
#include <string.h>
#include <util/general.h>
#include <util/symtab.h>
#include <util/symtab_stack.h>
#include <util/dlink.h>
#include <util/string_utils.h>
#include "mips_mgmt.h"

#define SYMTABLE_SIZE 100
#define SYMTAB_VALUE_FIELD     "value"
#define PRINTF(...) printf(__VA_ARGS__)

/*********************EXTERNAL DECLARATIONS***********************/

EXTERN(void,Cminus_error,(const char*));

EXTERN(int,Cminus_lex,(void));

extern register_file_t g_RF;

char *fileName;

SymTable symtab;

// stacks for the various constructs that require data passing
int condStack[10];
int whileStack[10];
int arrStack[10];

// while stack index
int whstidx = 0;
// conditional stack index
int condstidx = 0;
// array stack index
int arrstidx = 0;

// methods for the conditional stack
int condStackPop();
int condStackPeek();
void condStackPush(int i);

// methods for the while stack
int whileStackPop();
int whileStackPeek();
void whileStackPush(int i);

// methods for the var stack
int varStackPop();
int varStackPeek();
void varStackPush(int b);

// gets a new, unique integer identifier for conditionals or while loops
int obtainCond();
int obtainWhile();

extern int Cminus_lineno;

extern FILE *Cminus_in;
%}

%name-prefix="Cminus_"
%defines

%start Program

%token AND
%token ELSE
%token EXIT
%token FOR
%token IF         
%token INTEGER 
%token NOT         
%token OR         
%token READ
%token WHILE
%token WRITE
%token LBRACE
%token RBRACE
%token LE
%token LT
%token GE
%token GT
%token EQ
%token NE
%token ASSIGN
%token COMMA
%token SEMICOLON
%token LBRACKET
%token RBRACKET
%token LPAREN
%token RPAREN
%token PLUS
%token TIMES
%token IDENTIFIER
%token DIVIDE
%token RETURN
%token STRING    
%token INTCON
%token MINUS

%left OR
%left AND
%left NOT
%left LT LE GT GE NE EQ
%left PLUS MINUS
%left TIMES DIVDE

/***********************PRODUCTIONS****************************/
%%
   Program        : Procedures 
        {
            //printf("<Program> -> <Procedures>\n");
        }
        | DeclList Procedures
        {
            //printf("<Program> -> <DeclList> <Procedures>\n");
        }
          ;

Procedures     : ProcedureDecl Procedures
            {
            //printf("<Procedures> -> <ProcedureDecl> <Procedures>\n");
        }
        |
        {
            //printf("<Procedures> -> epsilon\n");
        }
        ;

ProcedureDecl : ProcedureHead ProcedureBody
              {
            //printf("<ProcedureDecl> -> <ProcedureHead> <ProcedureBody>\n");
        }
              ;

ProcedureHead : FunctionDecl DeclList 
              {
            //printf("<ProcedureHead> -> <FunctionDecl> <DeclList>\n");
        }
          | FunctionDecl
        {
            //printf("<ProcedureHead> -> <FunctionDecl>\n");
        }
              ;

FunctionDecl :  Type IDENTIFIER LPAREN RPAREN LBRACE 
             {
            //printf("<FunctionDecl> ->  <Type> <IDENTIFIER> <LP> <RP> <LBR>\n"); 
        }
            ;

ProcedureBody : StatementList RBRACE
              {
            //printf("<ProcedureBody> -> <StatementList> <RBR>\n");
        }
          ;


DeclList     : Type IdentifierList  SEMICOLON 
          {
            //printf("<DeclList> -> <Type> <IdentifierList> <SC>\n");
        }        
        | DeclList Type IdentifierList SEMICOLON
        {
            //printf("<DeclList> -> <DeclList> <Type> <IdentifierList> <SC>\n");
        }
            ;


IdentifierList     : VarDecl  
                {
            //printf("<IdentifierList> -> <VarDecl>\n");
        }

| IdentifierList COMMA VarDecl
        {
            //printf("<IdentifierList> -> <IdentifierList> <CM> <VarDecl>\n");
        }
                ;

VarDecl     : IDENTIFIER
         { 
            setValue($1, g_GP_NEXT_OFFSET);
            g_GP_NEXT_OFFSET += 4; // next slot for a 4B value.
            //printf("<VarDecl> -> <IDENTIFIER\n");
        }
        | IDENTIFIER LBRACKET INTCON RBRACKET
                {
            //printf("<VarDecl> -> <IDENTIFIER> <LBK> <INTCON> <RBK>\n");
            setValue($1, g_GP_NEXT_OFFSET);
            g_GP_NEXT_OFFSET += 4 * $3;
        }
        ;

Type         : INTEGER 
          { 
            //printf("<Type> -> <INTEGER>\n");
        }
                ;

Statement     : Assignment
           { 
            //$$=$1;
            //printf("<Statement> -> <Assignment>\n");
        }
                | IfStatement
        { 
            //printf("<Statement> -> <IfStatement>\n");
        }
        | WhileStatement
        { 
            //printf("<Statement> -> <WhileStatement>\n");
        }
                | IOStatement 
        { 
            //printf("<Statement> -> <IOStatement>\n");
        }
        | ReturnStatement
        { 
            //printf("<Statement> -> <ReturnStatement>\n");
        }
        | ExitStatement    
        { 
            //printf("<Statement> -> <ExitStatement>\n");
        }
        | CompoundStatement
        { 
            //printf("<Statement> -> <CompoundStatement>\n");
        }
                ;

Assignment      : Variable ASSIGN Expr SEMICOLON
            {
            // pull a value off the variable stack that determines whether or 
            //  not this value was pulled from an array, false if not, the 
            //  number of the register that has the address offset if so
            int popped = varStackPop();
            if (!popped) {
                issue_sw($3, GP, $1);
            }
            else {
                issue_sw($3, popped, $1);
                reg_free(popped);
            }

            reg_free($3);
        }
                ;

IfStatement    : IF TestAndThen ELSE CompoundStatement
            {
            // get the index of the if that this else corresponds to,
            //  and finish with this conditional
            int temp = condStackPop();
            printf("else%d:\n", temp);
        }
        | IF TestAndThen
        {
            //printf("<IfStatement> -> <IF> <TestAndThen>\n");
            // same as above
            int temp = condStackPop();
            printf("else%d:\n", temp); 
        }
        ;

TestAndThen    : Test CompoundStatement
            {
            //printf("<TestAndThen> -> <Test> <CompoundStatement>\n");
            // after we're done processing the compound statement, 
            //  print the else identifier and the place to jump to if 
            //  the original conditional fails
            int temp = condStackPeek();
            printf("\tj   else%d\n", temp);
            printf("acond%d:\n", temp);
        }
        ;

Test        : LPAREN Expr RPAREN
      {
            //printf("<Test> -> <LP> <Expr> <RP>\n"); 
            // get a new index and add a branch for this if
            int temp = obtainCond();
            condStackPush(temp);
            printf("\tbeqz $%s, acond%d\n", REG_NAME($2), temp);
            reg_free($2);
        }
        ;


WhileStatement  : WhileToken WhileExpr Statement
                {
            //printf("<WhileStatement> -> <WhileToken> <WhileExpr> <Statement>\n");
            // after the end of the loop, print a jump to the beginning of 
            //  this loop, say we're done with the loop, and a label to 
            //  jump to after loop execution is done
            int temp = whileStackPop();
            printf("\tj bwhile%d\n", temp);
            printf("awhile%d:\n", temp); 
        }
                ;

WhileExpr    : LPAREN Expr RPAREN
          {
            //printf("<WhileExpr> -> <LP> <Expr> <RP>\n");
            // print the jump to after the loop if we're done
            printf("\tbeqz $%s, awhile%d\n", REG_NAME($2),
                        whileStackPeek()); 
            reg_free($2);
        }
        ;

WhileToken    : WHILE
           {
            //printf("<WhileToken> -> <WHILE>\n");
            // give this loop an index and print the place to jump to to recheck
            //  the conditional
            int temp = obtainWhile();
            whileStackPush(temp);
            printf("bwhile%d:\n", temp);
            
        }
        ;


IOStatement     : READ LPAREN Variable RPAREN SEMICOLON
                {
          reg_idx_t reg = reg_alloc();
          read_int(reg); // read value from stdin and store into reg
          // pop a value off the stack that determines if this is an 
          //  array value
          int popped = varStackPop();
          if (!popped) {
              issue_sw(reg, GP, $3); // store reg's content at variable's location
          }
          else {
              issue_sw(reg, popped, $3);
          }
          reg_free(reg);
        }
                | WRITE LPAREN Expr RPAREN SEMICOLON
        {
            write_reg_value($3);
            reg_free($3);
            //printf("<IOStatement> -> <WRITE> <LP> <Expr> <RP> <SC>\n");
        }
                | WRITE LPAREN StringConstant RPAREN SEMICOLON         
        {
            write_const_string($3);
            write_new_line();
            reg_free($3);
            //printf("<IOStatement> -> <WRITE> <LP> <StringConstant> <RP> <SC>\n");
        }
                ;

ReturnStatement : RETURN Expr SEMICOLON
                {
            //printf("<ReturnStatement> -> <RETURN> <Expr> <SC>\n");
        }
                ;

ExitStatement     : EXIT SEMICOLON
               {
            //printf("<ExitStatement> -> <EXIT> <SC>\n");
        }
        ;

CompoundStatement : LBRACE StatementList RBRACE
                  {
            //printf("<CompoundStatement> -> <LBR> <StatementList> <RBR>\n");
        }
                ;

StatementList   : Statement
                {        
            //printf("<StatementList> -> <Statement>\n");
        }
                | StatementList Statement
        {        
            //printf("<StatementList> -> <StatementList> <Statement>\n");
        }
                ;

Expr            : SimpleExpr
                {
            $$ = $1;
            //printf("<Expr> -> <SimpleExpr>\n");
        }
                | Expr OR SimpleExpr 
        {
            reg_idx_t reg = reg_alloc();
            ISSUE_OR(reg, $1, $3);
            reg_free($1);
            reg_free($3);
            $$ = reg;
            //printf("<Expr> -> <Expr> <OR> <SimpleExpr> \n");
        }
                | Expr AND SimpleExpr 
        {
            reg_idx_t reg = reg_alloc();
            ISSUE_AND(reg, $1, $3);
            reg_free($1);
            reg_free($3);
            $$ = reg;
            //printf("<Expr> -> <Expr> <AND> <SimpleExpr> \n");
        }
                | NOT SimpleExpr 
        {
            reg_idx_t reg = reg_alloc();
            ISSUE_XORI(reg, $2, 1);
            reg_free($2);
            $$ = reg;
            //printf("<Expr> -> <NOT> <SimpleExpr> \n");
        }
                ;

SimpleExpr    : AddExpr
           {
            $$ = $1;
            //printf("<SimpleExpr> -> <AddExpr>\n");
        }
                | SimpleExpr EQ AddExpr
        {
            reg_idx_t reg = reg_alloc();
            issue_op("seq", reg, $1, $3);
            reg_free($1);
            reg_free($3);
            $$ = reg;
            //printf("<SimpleExpr> -> <SimpleExpr> <EQ> <AddExpr> \n");
        }
                | SimpleExpr NE AddExpr
        {
            reg_idx_t reg = reg_alloc();
            issue_op("sne", reg, $1, $3);
            reg_free($1);
            reg_free($3);
            $$ = reg;
            //printf("<SimpleExpr> -> <SimpleExpr> <NE> <AddExpr> \n");
        }
                | SimpleExpr LE AddExpr
        {
            reg_idx_t reg = reg_alloc();
            issue_op("sle", reg, $1, $3);
            reg_free($1);
            reg_free($3);
            $$ = reg;
            //printf("<SimpleExpr> -> <SimpleExpr> <LE> <AddExpr> \n");
        }
                | SimpleExpr LT AddExpr
        {
            reg_idx_t reg = reg_alloc();
            issue_op("slt", reg, $1, $3);
            reg_free($1);
            reg_free($3);
            $$ = reg;
            //printf("<SimpleExpr> -> <SimpleExpr> <LT> <AddExpr> \n");
        }
                | SimpleExpr GE AddExpr
        {
            reg_idx_t reg = reg_alloc();
            issue_op("sge", reg, $1, $3);
            reg_free($1);
            reg_free($3);
            $$ = reg;
            //printf("<SimpleExpr> -> <SimpleExpr> <GE> <AddExpr> \n");
        }
                | SimpleExpr GT AddExpr
        {
            reg_idx_t reg = reg_alloc();
            issue_op("sgt", reg, $1, $3);
            reg_free($1);
            reg_free($3);
            $$ = reg;
            //printf("<SimpleExpr> -> <SimpleExpr> <GT> <AddExpr> \n");
        }
                ;

AddExpr        :  MulExpr            
         {
            $$ = $1;
            //printf("<AddExpr> -> <MulExpr>\n");
        }
                |  AddExpr PLUS MulExpr
        {
            reg_idx_t reg = reg_alloc();
            ISSUE_ADD(reg, $1, $3);
            reg_free($1);
            reg_free($3);
            $$ = reg;
            //printf("<AddExpr> -> <AddExpr> <PLUS> <MulExpr> \n");
        }
                |  AddExpr MINUS MulExpr
        {
            reg_idx_t reg = reg_alloc();
            ISSUE_SUB(reg, $1, $3);
            reg_free($1);
            reg_free($3);
            $$ = reg;
            //printf("<AddExpr> -> <AddExpr> <MINUS> <MulExpr> \n");
        }
                ;

MulExpr        :  Factor
         {
            $$ = $1;
            //printf("<MulExpr> -> <Factor>\n");
        }
                |  MulExpr TIMES Factor
        {
            reg_idx_t reg = reg_alloc();
            ISSUE_MUL(reg, $1, $3);
            reg_free($1);
            reg_free($3);
            $$ = reg;
            //printf("<MulExpr> -> <MulExpr> <TIMES> <Factor> \n");
        }
                |  MulExpr DIVIDE Factor
        {
            reg_idx_t reg = reg_alloc();
            ISSUE_DIV(reg, $1, $3);
            reg_free($1);
            reg_free($3);
            $$ = reg;
            //printf("<MulExpr> -> <MulExpr> <DIVIDE> <Factor> \n");
        }        
                ;

Factor          : Variable
                { 
            reg_idx_t reg    = reg_alloc();
            // pop a value off that tells us if the variable we're getting 
            //  this from is an array value, use the reg offset if it is
            int popped = varStackPop();
            if (!popped) {
                issue_lw(reg, GP, $1);
            }
            else {
                issue_lw(reg, popped, $1);
                reg_free(popped);
            }   
            $$ = reg;
            //printf("<Factor> -> <Variable>\n");
        }
                | Constant
        { 
            reg_idx_t reg = reg_alloc();
            issue_li(reg, $1);
            $$ = reg;
            //printf("<Factor> -> <Constant>\n");
        }
                | IDENTIFIER LPAREN RPAREN
            {    
            //printf("<Factor> -> <IDENTIFIER> <LP> <RP>\n");
        }
            | LPAREN Expr RPAREN
        {
            $$ = $2;
            //printf("<Factor> -> <LP> <Expr> <RP>\n");
        }
                ;  

Variable        : IDENTIFIER
                {
            int offset = getValue($1);
            $$ = offset;
            varStackPush(false);
            //printf("<Variable> -> <IDENTIFIER>\n");
        }
                | IDENTIFIER LBRACKET Expr RBRACKET    
        {
            // figure out the static offset
            int offset = getValue($1);
            // multiply the array index by the size of the values
            printf("\tmul $%s, $%s, 4\n", REG_NAME($3), REG_NAME($3));
            // add this to the current value of GP to get (GP + 4 * index)(offset)
            printf("\tadd $%s, $gp, $%s\n", REG_NAME($3), REG_NAME($3));
            $$ = offset;
            // the register we're using for this goes in the stack
            varStackPush($3);
            //printf("<Variable> -> <IDENTIFIER> <LBK> <Expr> <RBK>\n");
        }
                ; 

StringConstant     : STRING
                { 
            reg_idx_t reg   = reg_alloc();
            char*     label = SymGetFieldByIndex(symtab, $1, SYM_NAME_FIELD);
            issue_la(reg, label);
            $$ = reg;
            //$$=$1;
            //printf("<StringConstant> -> <STRING>\n");
        }
                ;

Constant        : INTCON
                { 
            $$ = $1;
            //printf("<Constant> -> <INTCON>\n");
        }
                ;

%%


/********************C ROUTINES *********************************/

void Cminus_error(const char *s)
{
    fprintf(stderr,"%s: line %d: %s\n",fileName,Cminus_lineno,s);
}

int Cminus_wrap() {
    return 1;
}

static void initialize(char* inputFileName) {

    Cminus_in = fopen(inputFileName,"r");
    if (Cminus_in == NULL) {
          fprintf(stderr,"Error: Could not open file %s\n",inputFileName);
          exit(-1);
    }

    char* dotChar = rindex(inputFileName,'.');
    int endIndex = strlen(inputFileName) - strlen(dotChar);
    char *outputFileName = nssave(2,substr(inputFileName,0,endIndex),".s");
    stdout = freopen(outputFileName,"w",stdout);
    if (stdout == NULL) {
          fprintf(stderr,"Error: Could not open file %s\n",outputFileName);
          exit(-1);
    }

    symtab = SymInit(SYMTABLE_SIZE);
    SymInitField(symtab,SYMTAB_VALUE_FIELD,(Generic)-1,NULL);
}

static void finalize() {
    SymKillField(symtab,SYMTAB_VALUE_FIELD);
    SymKill(symtab);
    fclose(Cminus_in);
    fclose(stdout);

}

int main(int argc, char** argv) {    
    fileName = argv[1];
    initialize(fileName);

    print_prolog();

    Cminus_parse();

    print_epilog();

    SymDump(symtab);
    print_string_labels();

    finalize();

    return 0;
}

long getValue(int index)
{
    return (long)SymGetFieldByIndex(symtab, index, SYMTAB_VALUE_FIELD); 
}

int setValue(int index, long value)
{
    SymPutFieldByIndex(symtab, index, SYMTAB_VALUE_FIELD, (Generic)value); 
}

// see comments for these above
int condStackPop() {
    return condStack[--condstidx];
}

void condStackPush(int i) {
    condStack[condstidx] = i;
    condstidx++;
}

int condStackPeek() {
    return condStack[condstidx - 1];
}

int whileStackPop() {
    return whileStack[--whstidx]; 
}

int whileStackPeek() {
    return whileStack[whstidx - 1];
}

void whileStackPush(int i) {
    whileStack[whstidx] = i;
    whstidx++;
}

int varStackPop() {
    return arrStack[--arrstidx];
}

int varStackPeek() {
    return arrStack[arrstidx - 1];
}

void varStackPush(int b) {
    arrStack[arrstidx] = b;
    arrstidx++;
}

int obtainCond() {
    static int c = 0;
    return c++;
}

int obtainWhile() {
    static int c = 0;
    return c++;
}
/******************END OF C ROUTINES**********************/
