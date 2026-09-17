
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name chuzuchejijiaqi -dir "C:/Users/26318/Desktop/Fpga_Study/chuzuchejijiaqi/planAhead_run_5" -part xc3s50antqg144-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/26318/Desktop/Fpga_Study/chuzuchejijiaqi/Control.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/26318/Desktop/Fpga_Study/chuzuchejijiaqi} }
set_property target_constrs_file "chuzuchejijiaqi.ucf" [current_fileset -constrset]
add_files [list {chuzuchejijiaqi.ucf}] -fileset [get_property constrset [current_run]]
link_design
