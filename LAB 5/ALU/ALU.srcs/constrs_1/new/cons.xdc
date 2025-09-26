##Switches
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports op1[0] ];
#IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports op1[1] ];
#IO_L3N_T0_DQS_EMCCLK_14 Sch=sw[1]
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports op1[2]];
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports op1[3]];
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports op1[4]];
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports op1[5]];

set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports op2[0]];
set_property -dict { PACKAGE_PIN R13 IOSTANDARD LVCMOS33 } [get_ports op2[1]];
set_property -dict { PACKAGE_PIN T8 IOSTANDARD LVCMOS33 } [get_ports op2[2]];
set_property -dict { PACKAGE_PIN U8 IOSTANDARD LVCMOS33 } [get_ports op2[3]];
set_property -dict { PACKAGE_PIN R16 IOSTANDARD LVCMOS33 } [get_ports op2[4]];
set_property -dict { PACKAGE_PIN T13 IOSTANDARD LVCMOS33 } [get_ports op2[5]];

set_property -dict { PACKAGE_PIN H6 IOSTANDARD LVCMOS33 } [get_ports operation[0]];
set_property -dict { PACKAGE_PIN U12 IOSTANDARD LVCMOS33 } [get_ports operation[1]];
set_property -dict { PACKAGE_PIN U11 IOSTANDARD LVCMOS33 } [get_ports operation[2]];
#IO_L3N_T0_DQS_EMCCLK_14 Sch=sw[2]
## LEDs
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports result[0]];
#IO_L18P_T2_A24_15 Sch=led[0]
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports result[1]];
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports result[2]];
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports result[3]];
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports result[4]];
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports result[5]];

set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports c_flag];
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports s_flag];
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports z_flag];
set_property -dict { PACKAGE_PIN T15 IOSTANDARD LVCMOS33 } [get_ports ov_flag];
#IO_L18P_T2_A24_15 Sch=led[1]