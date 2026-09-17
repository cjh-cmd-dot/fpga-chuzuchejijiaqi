/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/26318/Desktop/Fpga_Study/chuzuchejijiaqi/control_tb.v";
static const char *ng1 = "FAIL time=%0t cstate=%b LED_out=%b expected_state=%b expected_led=%b";
static int ng2[] = {1, 0};
static const char *ng3 = "PASS time=%0t cstate=%b LED_out=%b";
static unsigned int ng4[] = {0U, 0U};
static int ng5[] = {0, 0};
static unsigned int ng6[] = {1U, 0U};
static unsigned int ng7[] = {2U, 0U};
static const char *ng8 = "TEST PASS";
static const char *ng9 = "TEST FAIL errors=%0d";



static int sp_check_state(char *t1, char *t2)
{
    char t12[8];
    char t15[8];
    char t32[8];
    char t35[8];
    char t43[8];
    char t77[16];
    int t0;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t33;
    char *t34;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t78;
    char *t79;
    char *t80;
    char *t81;
    char *t82;
    char *t83;
    char *t84;
    char *t85;
    char *t86;
    char *t87;
    char *t88;
    char *t89;
    char *t90;

LAB0:    t0 = 1;
    t3 = (t2 + 28U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 484);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(22, ng0);

LAB5:    xsi_set_current_line(23, ng0);
    t5 = (t1 + 4556);
    t6 = *((char **)t5);
    t7 = ((((char*)(t6))) + 36U);
    t8 = *((char **)t7);
    t9 = (t1 + 1728);
    t10 = (t9 + 36U);
    t11 = *((char **)t10);
    memset(t12, 0, 8);
    if (*((unsigned int *)t8) != *((unsigned int *)t11))
        goto LAB7;

LAB6:    t13 = (t8 + 4);
    t14 = (t11 + 4);
    if (*((unsigned int *)t13) != *((unsigned int *)t14))
        goto LAB7;

LAB8:    memset(t15, 0, 8);
    t16 = (t12 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (~(t17));
    t19 = *((unsigned int *)t12);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t16) != 0)
        goto LAB11;

LAB12:    t23 = (t15 + 4);
    t24 = *((unsigned int *)t15);
    t25 = (!(t24));
    t26 = *((unsigned int *)t23);
    t27 = (t25 || t26);
    if (t27 > 0)
        goto LAB13;

LAB14:    memcpy(t43, t15, 8);

LAB15:    t71 = (t43 + 4);
    t72 = *((unsigned int *)t71);
    t73 = (~(t72));
    t74 = *((unsigned int *)t43);
    t75 = (t74 & t73);
    t76 = (t75 != 0);
    if (t76 > 0)
        goto LAB26;

LAB27:    xsi_set_current_line(30, ng0);
    t4 = xsi_vlog_time(t77, 1000.0000000000000, 1000.0000000000000);
    t5 = (t1 + 4604);
    t6 = *((char **)t5);
    t7 = ((((char*)(t6))) + 36U);
    t8 = *((char **)t7);
    t9 = (t1 + 1040U);
    t10 = *((char **)t9);
    t9 = (t1 + 484);
    xsi_vlogfile_write(1, 0, 0, ng3, 4, t9, (char)118, t77, 64, (char)118, t8, 2, (char)118, t10, 1);

LAB28:
LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 28U);
    *((char **)t4) = &&LAB2;
    t0 = 0;

LAB1:    return t0;
LAB7:    *((unsigned int *)t12) = 1;
    goto LAB8;

LAB9:    *((unsigned int *)t15) = 1;
    goto LAB12;

LAB11:    t22 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB12;

LAB13:    t28 = (t1 + 1040U);
    t29 = *((char **)t28);
    t28 = (t1 + 1820);
    t30 = (t28 + 36U);
    t31 = *((char **)t30);
    memset(t32, 0, 8);
    if (*((unsigned int *)t29) != *((unsigned int *)t31))
        goto LAB17;

LAB16:    t33 = (t29 + 4);
    t34 = (t31 + 4);
    if (*((unsigned int *)t33) != *((unsigned int *)t34))
        goto LAB17;

LAB18:    memset(t35, 0, 8);
    t36 = (t32 + 4);
    t37 = *((unsigned int *)t36);
    t38 = (~(t37));
    t39 = *((unsigned int *)t32);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t36) != 0)
        goto LAB21;

LAB22:    t44 = *((unsigned int *)t15);
    t45 = *((unsigned int *)t35);
    t46 = (t44 | t45);
    *((unsigned int *)t43) = t46;
    t47 = (t15 + 4);
    t48 = (t35 + 4);
    t49 = (t43 + 4);
    t50 = *((unsigned int *)t47);
    t51 = *((unsigned int *)t48);
    t52 = (t50 | t51);
    *((unsigned int *)t49) = t52;
    t53 = *((unsigned int *)t49);
    t54 = (t53 != 0);
    if (t54 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB15;

LAB17:    *((unsigned int *)t32) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t35) = 1;
    goto LAB22;

LAB21:    t42 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t42) = 1;
    goto LAB22;

LAB23:    t55 = *((unsigned int *)t43);
    t56 = *((unsigned int *)t49);
    *((unsigned int *)t43) = (t55 | t56);
    t57 = (t15 + 4);
    t58 = (t35 + 4);
    t59 = *((unsigned int *)t57);
    t60 = (~(t59));
    t61 = *((unsigned int *)t15);
    t62 = (t61 & t60);
    t63 = *((unsigned int *)t58);
    t64 = (~(t63));
    t65 = *((unsigned int *)t35);
    t66 = (t65 & t64);
    t67 = (~(t62));
    t68 = (~(t66));
    t69 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t69 & t67);
    t70 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t70 & t68);
    goto LAB25;

LAB26:    xsi_set_current_line(24, ng0);

LAB29:    xsi_set_current_line(25, ng0);
    t78 = xsi_vlog_time(t77, 1000.0000000000000, 1000.0000000000000);
    t79 = (t1 + 4580);
    t80 = *((char **)t79);
    t81 = ((((char*)(t80))) + 36U);
    t82 = *((char **)t81);
    t83 = (t1 + 1040U);
    t84 = *((char **)t83);
    t83 = (t1 + 1728);
    t85 = (t83 + 36U);
    t86 = *((char **)t85);
    t87 = (t1 + 1820);
    t88 = (t87 + 36U);
    t89 = *((char **)t88);
    t90 = (t1 + 484);
    xsi_vlogfile_write(1, 0, 0, ng1, 6, t90, (char)118, t77, 64, (char)118, t82, 2, (char)118, t84, 1, (char)118, t86, 2, (char)118, t89, 1);
    xsi_set_current_line(27, ng0);
    t4 = (t1 + 1636);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng2)));
    memset(t12, 0, 8);
    xsi_vlog_signed_add(t12, 32, t6, 32, t7, 32);
    t8 = (t1 + 1636);
    xsi_vlogvar_assign_value(t8, t12, 0, 0, 32);
    goto LAB28;

}

static void Initial_35_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(35, ng0);
    t1 = ((char*)((ng4)));
    t2 = (t0 + 1268);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);

LAB1:    return;
}

static void Always_36_1(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 2488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 2388);
    xsi_process_wait(t2, 41667LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(36, ng0);
    t4 = (t0 + 1268);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 1268);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Initial_38_2(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(38, ng0);
    t1 = ((char*)((ng4)));
    t2 = (t0 + 1544);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);

LAB1:    return;
}

static void Always_39_3(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 2776U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 2676);
    xsi_process_wait(t2, 500000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(39, ng0);
    t4 = (t0 + 1544);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 1544);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Initial_41_4(char *t0)
{
    char t22[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;

LAB0:    t1 = (t0 + 2920U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);

LAB4:    xsi_set_current_line(42, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1636);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(43, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1360);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1452);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(46, ng0);
    t2 = (t0 + 2820);
    xsi_process_wait(t2, 200000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1360);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 2820);
    xsi_process_wait(t2, 250000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng4)));
    t3 = ((char*)((ng4)));
    t4 = (t0 + 2820);
    t5 = (t0 + 484);
    t6 = xsi_create_subprogram_invocation(t4, 0, t0, t5, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t5, t6);
    t7 = (t0 + 1728);
    xsi_vlogvar_assign_value(t7, t2, 0, 0, 2);
    t8 = (t0 + 1820);
    xsi_vlogvar_assign_value(t8, t3, 0, 0, 1);

LAB9:    t9 = (t0 + 2872);
    t10 = *((char **)t9);
    t11 = (t10 + 44U);
    t12 = *((char **)t11);
    t13 = (t12 + 148U);
    t14 = *((char **)t13);
    t15 = (t14 + 0U);
    t16 = *((char **)t15);
    t17 = ((int  (*)(char *, char *))t16)(t0, t10);

LAB11:    if (t17 != 0)
        goto LAB12;

LAB7:    t10 = (t0 + 484);
    xsi_vlog_subprogram_popinvocation(t10);

LAB8:    t18 = (t0 + 2872);
    t19 = *((char **)t18);
    t18 = (t0 + 484);
    t20 = (t0 + 2820);
    t21 = 0;
    xsi_delete_subprogram_invocation(t18, t19, t0, t20, t21);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2820);
    xsi_process_wait(t2, 250000LL);
    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB10:;
LAB12:    t9 = (t0 + 2920U);
    *((char **)t9) = &&LAB9;
    goto LAB1;

LAB13:    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1452);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 2820);
    xsi_process_wait(t2, 200000LL);
    *((char **)t1) = &&LAB14;
    goto LAB1;

LAB14:    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1452);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 2820);
    xsi_process_wait(t2, 200000LL);
    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB15:    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1452);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2820);
    xsi_process_wait(t2, 1500000LL);
    *((char **)t1) = &&LAB16;
    goto LAB1;

LAB16:    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng6)));
    t4 = (t0 + 2820);
    t5 = (t0 + 484);
    t6 = xsi_create_subprogram_invocation(t4, 0, t0, t5, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t5, t6);
    t7 = (t0 + 1728);
    xsi_vlogvar_assign_value(t7, t2, 0, 0, 2);
    t8 = (t0 + 1820);
    xsi_vlogvar_assign_value(t8, t3, 0, 0, 1);

LAB19:    t9 = (t0 + 2872);
    t10 = *((char **)t9);
    t11 = (t10 + 44U);
    t12 = *((char **)t11);
    t13 = (t12 + 148U);
    t14 = *((char **)t13);
    t15 = (t14 + 0U);
    t16 = *((char **)t15);
    t17 = ((int  (*)(char *, char *))t16)(t0, t10);

LAB21:    if (t17 != 0)
        goto LAB22;

LAB17:    t10 = (t0 + 484);
    xsi_vlog_subprogram_popinvocation(t10);

LAB18:    t18 = (t0 + 2872);
    t19 = *((char **)t18);
    t18 = (t0 + 484);
    t20 = (t0 + 2820);
    t21 = 0;
    xsi_delete_subprogram_invocation(t18, t19, t0, t20, t21);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 2820);
    xsi_process_wait(t2, 30000000LL);
    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB20:;
LAB22:    t9 = (t0 + 2920U);
    *((char **)t9) = &&LAB19;
    goto LAB1;

LAB23:    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng6)));
    t4 = (t0 + 2820);
    t5 = (t0 + 484);
    t6 = xsi_create_subprogram_invocation(t4, 0, t0, t5, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t5, t6);
    t7 = (t0 + 1728);
    xsi_vlogvar_assign_value(t7, t2, 0, 0, 2);
    t8 = (t0 + 1820);
    xsi_vlogvar_assign_value(t8, t3, 0, 0, 1);

LAB26:    t9 = (t0 + 2872);
    t10 = *((char **)t9);
    t11 = (t10 + 44U);
    t12 = *((char **)t11);
    t13 = (t12 + 148U);
    t14 = *((char **)t13);
    t15 = (t14 + 0U);
    t16 = *((char **)t15);
    t17 = ((int  (*)(char *, char *))t16)(t0, t10);

LAB28:    if (t17 != 0)
        goto LAB29;

LAB24:    t10 = (t0 + 484);
    xsi_vlog_subprogram_popinvocation(t10);

LAB25:    t18 = (t0 + 2872);
    t19 = *((char **)t18);
    t18 = (t0 + 484);
    t20 = (t0 + 2820);
    t21 = 0;
    xsi_delete_subprogram_invocation(t18, t19, t0, t20, t21);
    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1452);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 2820);
    xsi_process_wait(t2, 1500000LL);
    *((char **)t1) = &&LAB30;
    goto LAB1;

LAB27:;
LAB29:    t9 = (t0 + 2920U);
    *((char **)t9) = &&LAB26;
    goto LAB1;

LAB30:    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng7)));
    t3 = ((char*)((ng4)));
    t4 = (t0 + 2820);
    t5 = (t0 + 484);
    t6 = xsi_create_subprogram_invocation(t4, 0, t0, t5, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t5, t6);
    t7 = (t0 + 1728);
    xsi_vlogvar_assign_value(t7, t2, 0, 0, 2);
    t8 = (t0 + 1820);
    xsi_vlogvar_assign_value(t8, t3, 0, 0, 1);

LAB33:    t9 = (t0 + 2872);
    t10 = *((char **)t9);
    t11 = (t10 + 44U);
    t12 = *((char **)t11);
    t13 = (t12 + 148U);
    t14 = *((char **)t13);
    t15 = (t14 + 0U);
    t16 = *((char **)t15);
    t17 = ((int  (*)(char *, char *))t16)(t0, t10);

LAB35:    if (t17 != 0)
        goto LAB36;

LAB31:    t10 = (t0 + 484);
    xsi_vlog_subprogram_popinvocation(t10);

LAB32:    t18 = (t0 + 2872);
    t19 = *((char **)t18);
    t18 = (t0 + 484);
    t20 = (t0 + 2820);
    t21 = 0;
    xsi_delete_subprogram_invocation(t18, t19, t0, t20, t21);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 2820);
    xsi_process_wait(t2, 5000000LL);
    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB34:;
LAB36:    t9 = (t0 + 2920U);
    *((char **)t9) = &&LAB33;
    goto LAB1;

LAB37:    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1452);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 2820);
    xsi_process_wait(t2, 1500000LL);
    *((char **)t1) = &&LAB38;
    goto LAB1;

LAB38:    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng4)));
    t3 = ((char*)((ng4)));
    t4 = (t0 + 2820);
    t5 = (t0 + 484);
    t6 = xsi_create_subprogram_invocation(t4, 0, t0, t5, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t5, t6);
    t7 = (t0 + 1728);
    xsi_vlogvar_assign_value(t7, t2, 0, 0, 2);
    t8 = (t0 + 1820);
    xsi_vlogvar_assign_value(t8, t3, 0, 0, 1);

LAB41:    t9 = (t0 + 2872);
    t10 = *((char **)t9);
    t11 = (t10 + 44U);
    t12 = *((char **)t11);
    t13 = (t12 + 148U);
    t14 = *((char **)t13);
    t15 = (t14 + 0U);
    t16 = *((char **)t15);
    t17 = ((int  (*)(char *, char *))t16)(t0, t10);

LAB43:    if (t17 != 0)
        goto LAB44;

LAB39:    t10 = (t0 + 484);
    xsi_vlog_subprogram_popinvocation(t10);

LAB40:    t18 = (t0 + 2872);
    t19 = *((char **)t18);
    t18 = (t0 + 484);
    t20 = (t0 + 2820);
    t21 = 0;
    xsi_delete_subprogram_invocation(t18, t19, t0, t20, t21);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 2820);
    xsi_process_wait(t2, 5000000LL);
    *((char **)t1) = &&LAB45;
    goto LAB1;

LAB42:;
LAB44:    t9 = (t0 + 2920U);
    *((char **)t9) = &&LAB41;
    goto LAB1;

LAB45:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 1636);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t22, 0, 8);
    xsi_vlog_signed_equal(t22, 32, t4, 32, t5, 32);
    t6 = (t22 + 4);
    t23 = *((unsigned int *)t6);
    t24 = (~(t23));
    t25 = *((unsigned int *)t22);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB46;

LAB47:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 1636);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng9, 2, t0, (char)119, t4, 32);

LAB48:    xsi_set_current_line(78, ng0);
    xsi_vlog_finish(1);
    goto LAB1;

LAB46:    xsi_set_current_line(75, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    goto LAB48;

}


extern void work_m_00000000003295784812_2672096584_init()
{
	static char *pe[] = {(void *)Initial_35_0,(void *)Always_36_1,(void *)Initial_38_2,(void *)Always_39_3,(void *)Initial_41_4};
	static char *se[] = {(void *)sp_check_state};
	xsi_register_didat("work_m_00000000003295784812_2672096584", "isim/Control_tb_isim_beh32.exe.sim/work/m_00000000003295784812_2672096584.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
