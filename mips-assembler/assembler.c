/*
 * assembler.c
 *
 *  Created on: Oct 3, 2011
 *      Author: nayef
 */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "file_parser.h"
#include "hash_table.h"

int search(char *instruction);

// Array that holds the supported instructions
char *instructions[] = {
    "la",    // I0
    "li",
    "lui",  // I1
    "lw",   // I2
    "sw",   // I3
    "ori",  // I4
    "andi", // I5
    "addi", // I6
    "beq",  // I7
    "slti", // I8
    "xori", // I9
    "lb",   // I10
    "lh",   // I11
    "lbu",  // I12
    "lhu",  // I13
    "sb",   // I14
    "sh",   // I15
    "addiu",  // I16
    "bne",  // I17
    "sltiu", // I18
    "bgez", // I19
    "bgtz", // I20
    "blez", // I21
    "bltz", // I22
    "bgezal",//I23
    "bltzal",//I24

    "MOV",
    "add",  // R0
    "sub",  // R1
    "xor",  // R2
    "jr",   // R3
    "addu", // R4
    "subu", // R5
    "or",   // R6
    "and",  // R7
    "slt",  // R8
    "sll",  // R9
    "srl",  // R10
    "nor",  // R11
    "sra",  // R12
    "sltu", // R13
    "sllv", // R14
    "srlv", // R15
    "srav", // R16
    "mult", // R17
    "multu",// R18
    "div",  // R19
    "divu", // R20
    "mthi", // R21
    "mtlo", // R22
    "mfhi", // R23
    "mflo", // R24
    "jalr", // R25
    "break",// R26
    "syscall",//R27
    "eret", // R28
    "mfc0", // R29 
    "mtc0", // R30 

    "j",    // J0
    "jal",  // J1

    "nop"
};

// Size of array
size_t inst_len = sizeof(instructions)/sizeof(char *);

int token_search(char *instruction) {

    int found = 0;

    for (int i = 0; i < inst_len; i++) {

        if (strcmp(instruction, instructions[i]) == 0) {
            found = 1;
            return i;
        }
    }

    if (found == 0)
        return -1;
}

// Quick Sort String Comparison Function
int string_comp(const void *a, const void *b)
{
    return strcmp(*(char **)a, *(char **)b);
}

int main (int argc, char *argv[])
{

    // Make sure correct number of arguments input
    if (0) {
        printf("Incorrect number of arguments");
    }

    else {

        // Open I/O files
        // Check that files opened properly
        FILE *In;
        if(argc >= 2) {
            In = fopen(argv[1], "r");
            printf("Read from %d", argv[1]);
        } else {
            In = fopen("test.asm", "r");
        }

        if (In == NULL) {
            printf("Input file could not be opened.");
            exit(1);
        }
		
		FILE *Inint;
        if(argc >= 2) {
            Inint = fopen(argv[1], "r");
            printf("Read from %d", argv[1]);
        } else {
            Inint = fopen("Inint.asm", "r");
        }

        if (Inint == NULL) {
            printf("Input file could not be opened.");
            exit(1);
        }

        FILE *outProg;      // 主程序coe文件
        outProg = fopen("text.coe", "w");
        if (outProg == NULL) {
            printf("Output file could not created.");
            exit(1);
        }

        FILE *outProgInt;   // 中断处理函数coe文件
        outProgInt = fopen("int.coe", "w");
        if (outProg == NULL) {
            printf("Output file could not created.");
            exit(1);
        }

        FILE *outInt;       // 中断向量表文件
        outInt = fopen("inttbl.coe", "w");
        if(outInt == NULL) {
            printf("Output file could not created.");
            exit(1);
        }

        FILE *outData;      // 用户数据文件
        outData = fopen("data.coe", "w");
        if (outData == NULL) {
            printf("Output file could not opened.");
            exit(1);
        }

        // Sort the array using qsort for faster search
        qsort(instructions, inst_len, sizeof(char *), string_comp);

        // Create a hash table of size 127
        hash_table_t *hash_table = create_hash_table(127);
        char *a = "memory_initialization_radix = 16";
        char *b = "memory_initialization_vector =";
        
        fprintf(outProg, "%s;\n%s\n",a,b);
        fprintf(outInt, "%s;\n%s\n",a,b);
      //  fprintf(outtest, "%s;\n%s\n",a,b);
//        for(int i=0;i<=65540;i++){
//			fprintf(outtest,"%s,\n","00000000");
//		}
        int passNumber = 1;
        // Parse in passes
        parse_file(In, Inint, passNumber, instructions, inst_len, hash_table, outProg, outProgInt, outInt, outData);
        // Rewind input file & start pass 2
        rewind(In);
        passNumber = 2;
        parse_file(In, Inint, passNumber, instructions, inst_len, hash_table, outProg, outProgInt, outInt, outData);

        // Close files
        fclose(In);
        fclose(Inint);

        fclose(outProg);
        fclose(outProgInt);
        fclose(outInt);
        fclose(outData);

        return 0;
    }
}
