#set_param tcl.commandEcho 0

set pro_dir [pwd]
puts $pro_dir

set src_dir $pro_dir/src
puts $src_dir

set lib_dir $pro_dir/lib
puts $lib_dir

# set pro_file "$pro_dir/dp32_processor.xpr"
# Open existing project
open_project "$pro_dir/dp32_processor.xpr"

# adding libraries
set lib_file "$lib_dir/dp32_pkg.vhd"
add_files $lib_file
set_property library dp32_lib [get_files $lib_file]

#adding files
set src_file "$src_dir/dp32.vhd"
add_files $src_file
set_property library dp32_lib [get_files $src_file]

update_compile_order -fileset sources_1
set_property top dp32 [current_fileset]






######   CHATGPT Reference Script  ######

# # --------------------------------------------------
# # Portable Vivado build script
# # --------------------------------------------------

# # Get directory where this script lives
# set script_dir [file dirname [info script]]

# # Project name
# set proj_name dp32_processor

# # Project directory
# set proj_dir "$script_dir/$proj_name"

# # Project file
# set proj_file "$proj_dir/$proj_name.xpr"

# # FPGA part (Basys3 example)
# set part xc7a35tcpg236-1

# # --------------------------------------------------
# # Open or create project
# # --------------------------------------------------

# if {[file exists $proj_file]} {
#     puts "Opening existing project: $proj_file"
#     open_project $proj_file
# } else {
#     puts "Creating new project: $proj_name"
#     create_project $proj_name $proj_dir -part $part
# }

# # --------------------------------------------------
# # Add source files
# # --------------------------------------------------

# set src_dir "$script_dir/src"
# set vhdl_files [glob -nocomplain "$src_dir/*.vhd"]

# if {[llength $vhdl_files] == 0} {
#     error "No VHDL files found in $src_dir"
# }

# add_files -norecurse $vhdl_files
# update_compile_order -fileset sources_1

# # Set top module (dp32.vhd contains entity dp32)
# set_property top dp32 [current_fileset]

# # --------------------------------------------------
# # Add constraints (if they exist)
# # --------------------------------------------------

# set constr_dir "$script_dir/constraints"
# set xdc_files [glob -nocomplain "$constr_dir/*.xdc"]

# if {[llength $xdc_files] > 0} {
#     add_files -fileset constrs_1 $xdc_files
#     puts "Constraints added."
# } else {
#     puts "No constraints found (ok for now)."
# }

# # --------------------------------------------------
# # Save project
# # --------------------------------------------------

# save_project
# puts "Project ready."
