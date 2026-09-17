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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003123327703_2272916532_init();
    work_m_00000000002596666128_0233327204_init();
    work_m_00000000001933493740_3166581731_init();
    work_m_00000000001611736346_1593961305_init();
    work_m_00000000001246222578_0495607475_init();
    work_m_00000000000249670400_2816492969_init();
    work_m_00000000004220513412_0054667052_init();
    work_m_00000000003581959412_2672096584_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003581959412_2672096584");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
