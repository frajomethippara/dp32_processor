#set_param tcl.commandEcho 0

# Project directories
set pro_dir [pwd]
set src_dir $pro_dir/src
set lib_dir $pro_dir/lib
set xdc_dir $pro_dir/constr

#FPGA part
set part xc7a35tcpg236-1

# Open or create project
if {[file exists "$pro_dir/dp32_processor.xpr"]} {
    puts "Opening project: $pro_dir/dp32_processor.xpr"
    open_project "$pro_dir/dp32_processor.xpr"
} else {
    puts "Creating project: dp32_processor"
    create_project dp32_processor $pro_dir -part $part

    add_files -fileset constrs_1 "$xdc_dir/Basys-3-Master.xdc"
    puts "Constraints added."

    # # adding libraries
    set lib_file "$lib_dir/dp32_pkg.vhd"
    add_files $lib_file
    set_property library dp32_lib [get_files $lib_file]

    # #adding files
    set src_file "$src_dir/dp32.vhd"
    add_files $src_file
    set_property library dp32_lib [get_files $src_file]
} 

update_compile_order -fileset sources_1
set_property top dp32 [current_fileset]


# Run synthesis
puts "\nRunning synthesis..."
launch_runs synth_1
wait_on_run synth_1

# Run implementation
puts "\nRunning implementation..."
launch_runs impl_1
wait_on_run impl_1

# # Generate bitstream
puts "\nGenerating bitstream..."
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1

puts "\n Build complete!"