    .global main
    .equ GRADE_A, 90       @ Constant for grade A threshold
    .equ GRADE_B, 75       @ Constant for grade B threshold
    .equ GRADE_C, 50       @ Constant for grade C threshold

main:
    @ Prompt user for input (optional, assuming the percentage grade is already in R5)
    @ Example: LDR R0, =input_message
    @          BL printf

    @ Compare R5 with grade thresholds
    CMP R5, #GRADE_A
    BGE grade_A

    CMP R5, #GRADE_B
    BGE grade_B

    CMP R5, #GRADE_C
    BGE grade_C

    @ Grade is F
    @ Example: LDR R0, =grade_f_message
    @          BL printf
    B done

grade_A:
    @ Congratulations! You got an A.
    @ Example: LDR R0, =grade_a_message
    @          BL printf
    B done

grade_B:
    @ Good job! You got a B.
    @ Example: LDR R0, =grade_b_message
    @          BL printf
    B done

grade_C:
    @ Not bad, you got a C.
    @ Example: LDR R0, =grade_c_message
    @          BL printf
    B done

done:
    @ Exit the program
    MOV R7, #1   @ Exit syscall number
    SWI #0       @ Make the syscall

    @ Data section (messages and possibly input)
    .section .data
    input_message:  .asciz "Enter your percentage grade: "
    grade_a_message: .asciz "Congratulations! You got an A.\n"
    grade_b_message: .asciz "Good job! You got a B.\n"
    grade_c_message: .asciz "Not bad, you got a C.\n"
    grade_f_message: .asciz "Sorry, you got an F.\n"
