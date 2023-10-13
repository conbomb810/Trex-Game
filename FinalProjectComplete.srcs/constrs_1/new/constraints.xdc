#Switches
set_property PACKAGE_PIN R2 [get_ports {DiffSelect}]
    set_property IOSTANDARD LVCMOS33 [get_ports {DiffSelect}]

##Buttons
set_property PACKAGE_PIN U18 [get_ports jumpButton]
	set_property IOSTANDARD LVCMOS33 [get_ports jumpButton]

##7 segment display
set_property PACKAGE_PIN W7 [get_ports {A}]
set_property IOSTANDARD LVCMOS33 [get_ports {A}]
set_property PACKAGE_PIN W6 [get_ports {B}]
set_property IOSTANDARD LVCMOS33 [get_ports {B}]
set_property PACKAGE_PIN U8 [get_ports {C}]
set_property IOSTANDARD LVCMOS33 [get_ports {C}]
set_property PACKAGE_PIN V8 [get_ports {D}]
set_property IOSTANDARD LVCMOS33 [get_ports {D}]
set_property PACKAGE_PIN U5 [get_ports {E}]
set_property IOSTANDARD LVCMOS33 [get_ports {E}]
set_property PACKAGE_PIN V5 [get_ports {F}]
set_property IOSTANDARD LVCMOS33 [get_ports {F}]
set_property PACKAGE_PIN U7 [get_ports {G}]
set_property IOSTANDARD LVCMOS33 [get_ports {G}]

set_property PACKAGE_PIN U2 [get_ports {ANConstraint[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {ANConstraint[0]}]
set_property PACKAGE_PIN U4 [get_ports {ANConstraint[1]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {ANConstraint[1]}]
set_property PACKAGE_PIN V4 [get_ports {ANConstraint[2]}]              
   set_property IOSTANDARD LVCMOS33 [get_ports {ANConstraint[2]}]
set_property PACKAGE_PIN W4 [get_ports {ANConstraint[3]}]          
   set_property IOSTANDARD LVCMOS33 [get_ports {ANConstraint[3]}]

set_property PACKAGE_PIN W5 [get_ports CLK]
    set_property IOSTANDARD LVCMOS33 [get_ports CLK]
    set_property -add -name sys_clk_pin -period 10.00 -waveform {0 5} {get_ports CLK}
