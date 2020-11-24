force -freeze sim:/counter/control_clk 1 0, 0 {5000 ps} -r {10 ns}
force -freeze sim:/counter/control_en 0 
force -freeze sim:/counter/control_rst 0
run 10 ns
force -freeze sim:/counter/control_en 1 
force -freeze sim:/counter/control_rst 1
run 20 ns
force -freeze sim:/counter/control_en 1 
force -freeze sim:/counter/control_rst 0
run 10 ns
force -freeze sim:/counter/control_en 1 
force -freeze sim:/counter/control_rst 0
run 20 ns
force -freeze sim:/counter/control_en 1 
force -freeze sim:/counter/control_rst 0
run 10 ns
force -freeze sim:/counter/control_en 1 
force -freeze sim:/counter/control_rst 0
run 10 ns
force -freeze sim:/counter/control_en 1 
force -freeze sim:/counter/control_rst 0
run 20 ns
force -freeze sim:/counter/control_en 1 
force -freeze sim:/counter/control_rst 0