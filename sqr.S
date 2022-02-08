.data
    two: .double 2.0
    three: .double 3.0
.text
.globl foo
foo:
    push %rsi
    push %rbx
    mov 56(%rsp), %r10


    xor %rsi, %rsi
    mov (%rcx, %r9, 8), %rbx
    fldl (%rbx)
    inc %rsi
begin_row:
    cmp %rdx, %rsi
    jge end_row

    fldl (%rbx, %rsi, 8)
    faddp
    inc %rsi
    jmp begin_row
end_row:

    xor %rsi, %rsi
    mov %rcx, %rbx
    mov (%rbx), %r11
    fldl (%r11, %r10, 8)
    inc %rsi
begin_column:
    cmp %r8, %rsi
    jge end_column

    mov (%rbx, %rsi, 8), %r11
    fldl (%r11, %r10, 8)
    fmulp

    inc %rsi
    jmp begin_column
end_column:

    sub $32, %rsp
    fstl (%rsp)
    vmovsd (%rsp), %xmm0
    call printDouble
    add $32, %rsp

    fxch %st(1)
    sub $32, %rsp
    fstl (%rsp)
    vmovsd (%rsp), %xmm0
    call printDouble
    add $32, %rsp
    fxch %st(1)



  fsubrp


  fstpl (%rsp)
  vmovsd (%rsp), %xmm0
  pop %rbx
  pop %rsi
  ret
