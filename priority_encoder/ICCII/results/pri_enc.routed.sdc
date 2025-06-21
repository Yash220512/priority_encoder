################################################################################
#
# Design name:  no_ADD
#
# Created by icc2 write_sdc on Mon Jun  2 05:32:52 2025
#
################################################################################

set sdc_version 2.1
set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA

################################################################################
#
# Units
# time_unit               : 1e-09
# resistance_unit         : 1000000
# capacitive_load_unit    : 1e-15
# voltage_unit            : 1
# current_unit            : 1e-06
# power_unit              : 1e-12
################################################################################


# Mode: func
# Corner: nom
# Scenario: func::nom

# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 1
create_clock -name Clock -period 2.3 -waveform {0 1.15} [get_ports {Clock}]
set_propagated_clock [get_clocks {Clock}]
# Warning: Libcell power domain derates are skipped!

# Set latency for io paths.
# -origin useful_skew
set_clock_latency -min 0.0245667 [get_clocks {Clock}]
# -origin useful_skew
set_clock_latency -max 0.0264549 [get_clocks {Clock}]
# Set propagated on clock sources to avoid removing latency for IO paths.
set_propagated_clock  [get_ports {Clock}]
set_clock_uncertainty -setup 0.001 [get_clocks {Clock}]
set_clock_uncertainty -hold 0.01 [get_clocks {Clock}]
# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 4
set_input_transition 0.5 [get_ports {Clock}]
# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 4
set_input_transition 0.5 [get_ports {d[3]}]
# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 4
set_input_transition 0.5 [get_ports {d[2]}]
# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 4
set_input_transition 0.5 [get_ports {d[1]}]
# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 4
set_input_transition 0.5 [get_ports {d[0]}]
# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 3
set_input_delay -clock [get_clocks {Clock}] -max 0.5 [get_ports {Clock}]
# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 3
set_input_delay -clock [get_clocks {Clock}] -max 0.5 [get_ports {d[3]}]
# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 3
set_input_delay -clock [get_clocks {Clock}] -max 0.5 [get_ports {d[2]}]
# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 3
set_input_delay -clock [get_clocks {Clock}] -max 0.5 [get_ports {d[1]}]
# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 3
set_input_delay -clock [get_clocks {Clock}] -max 0.5 [get_ports {d[0]}]
# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 6
set_output_delay -clock [get_clocks {Clock}] -max 0.5 [get_ports {q[1]}]
# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 6
set_output_delay -clock [get_clocks {Clock}] -max 0.5 [get_ports {q[0]}]
# /home/student/RTL2GDSII/CONSTRAINTS/pri_enc.sdc, line 6
set_output_delay -clock [get_clocks {Clock}] -max 0.5 [get_ports {v}]
set_max_transition 0.25 [current_design]
set_max_transition 0.15 [get_clocks {Clock}] -clock_path
