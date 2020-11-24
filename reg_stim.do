force -freeze sim:/reg/control_clk 1 0, 0 {5000 ps} -r {10 ns}
force -freeze sim:/reg/control_rst 0 
force -freeze sim:/reg/control_en 0 
force -freeze sim:/reg/signal_r 1010101010101010
run 20 ns
force -freeze sim:/reg/control_rst 1 
force -freeze sim:/reg/control_en 0 
force -freeze sim:/reg/signal_r 1010101010101010
run 20 ns
force -freeze sim:/reg/control_rst 0 
force -freeze sim:/reg/control_en 1 
force -freeze sim:/reg/signal_r 1010101010101010
run 20 ns
force -freeze sim:/reg/control_rst 0 
force -freeze sim:/reg/control_en 0 
force -freeze sim:/reg/signal_r 1111000000001111
run 20 ns
force -freeze sim:/reg/control_rst 1 
force -freeze sim:/reg/control_en 0 
force -freeze sim:/reg/signal_r 1111000000001111
run 20 ns