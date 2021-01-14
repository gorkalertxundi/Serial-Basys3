# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/iarambururo/OneDrive - Mondragon Unibertsitatea/.cosas de clase/2020-2021/2.curso/Sistemas programables/Vivado/Serial-Basys3-main/TX_Serial/Puerto_Serie.cache/wt} [current_project]
set_property parent.project_path {C:/Users/iarambururo/OneDrive - Mondragon Unibertsitatea/.cosas de clase/2020-2021/2.curso/Sistemas programables/Vivado/Serial-Basys3-main/TX_Serial/Puerto_Serie.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo {c:/Users/iarambururo/OneDrive - Mondragon Unibertsitatea/.cosas de clase/2020-2021/2.curso/Sistemas programables/Vivado/Serial-Basys3-main/TX_Serial/Puerto_Serie.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {C:/Users/iarambururo/OneDrive - Mondragon Unibertsitatea/.cosas de clase/2020-2021/2.curso/Sistemas programables/Vivado/Serial-Basys3-main/TX_Serial/Puerto_Serie.srcs/sources_1/new/FrekuentziaZatitzailea.vhd}
  {C:/Users/iarambururo/OneDrive - Mondragon Unibertsitatea/.cosas de clase/2020-2021/2.curso/Sistemas programables/Vivado/Serial-Basys3-main/TX_Serial/Puerto_Serie.srcs/sources_1/new/transmisor.vhd}
  {C:/Users/iarambururo/OneDrive - Mondragon Unibertsitatea/.cosas de clase/2020-2021/2.curso/Sistemas programables/Vivado/Serial-Basys3-main/TX_Serial/Puerto_Serie.srcs/sources_1/new/top.vhd}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/iarambururo/OneDrive - Mondragon Unibertsitatea/.cosas de clase/2020-2021/2.curso/Sistemas programables/Vivado/Serial-Basys3-main/TX_Serial/Puerto_Serie.srcs/constrs_1/imports/Vivado/Basys3_Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/iarambururo/OneDrive - Mondragon Unibertsitatea/.cosas de clase/2020-2021/2.curso/Sistemas programables/Vivado/Serial-Basys3-main/TX_Serial/Puerto_Serie.srcs/constrs_1/imports/Vivado/Basys3_Master.xdc}}]


synth_design -top top -part xc7a35tcpg236-1


write_checkpoint -force -noxdef top.dcp

catch { report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb }
