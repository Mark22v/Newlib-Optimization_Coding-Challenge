
.section .text
.globl memset

/*MEMSET SUBROUTINE, RECIEVES 3 PARAMETERS:
    -PTR TO START WRITING (A0)
    -VALUE TO WRITE       (A1)
    -NUMBER OF BYTES      (A2)
  RETURNS NOTHING

    memset:
        //IF N BYTES IS 0, INMEDIATLY RETURN
        beqz    a2, memset_ret

        li      t0, 0b11
        and     t0, t0, a2
        beqz    t0, memset_2_set
 
    //BYTE BY BYTE CODE
    memset_1:
        sb      a1, 0(a0)
        addi    a2, a2, -1  //REDUCE BYTES LEFT
        addi    a0, a0, 1   //INCREASE ADRESS
        bnez    a2, memset_1
        j       memset_ret

    //4 BYTE AT ONCE OPTIMIZATION
    memset_2_set:
        mv      t0, a1
        slli    a1, a1, 8
        or      a1, a1, t0
        slli    a1, a1, 8
        or      a1, a1, t0
        slli    a1, a1, 8
        or      a1, a1, t0
    memset_2:
        sw      a1, 0(a0)
        addi    a2, a2, -4  //REDUCE BYTES LEFT
        addi    a0, a0, 4   //INCREASE ADRESS
        bnez    a2, memset_2
        
    memset_ret:
        ret*/

/*MEMSET SUBROUTINE, RECIEVES 3 PARAMETERS:
    -PTR TO START WRITING (A0)
    -VALUE TO WRITE       (A1)
    -NUMBER OF BYTES      (A2)
  RETURNS NOTHING 
  SECOND PROPOSED SOLUTION*/

    memset:
        //IF N BYTES IS 0, INMEDIATLY RETURN
        li      t1, 4
        blt     a2, t1, memset_2_check0

    //4 BYTE AT ONCE OPTIMIZATION
    memset_1_set:
        mv      t0, a1
        slli    a1, a1, 8
        or      a1, a1, t0
        slli    a1, a1, 8
        or      a1, a1, t0
        slli    a1, a1, 8
        or      a1, a1, t0
    memset_1:
        sw      a1, 0(a0)
        addi    a2, a2, -4  //REDUCE BYTES LEFT
        addi    a0, a0, 4   //INCREASE ADRESS
        bgeu    a2, t1, memset_1
        beqz    a2, memset_ret

    //BYTE BY BYTE CODE
    memset_2:
        sb      a1, 0(a0)
        addi    a2, a2, -1  //REDUCE BYTES LEFT
        addi    a0, a0, 1   //INCREASE ADRESS
    memset_2_check0:
        bnez    a2, memset_2
        
    memset_ret:
        ret

/*ORIGINAL CODE
   memset:
        mv t1, a0
        beqz a2, memset_ret
 
    memset_1:
        sb a1, 0(t1)
        addi   a2, a2, -1
        addi   t1, t1, 1
        bnez a2, memset_1
 
    memset_ret:
        ret*/
