force -freeze sim:/adder/signal_a 00000001 
force -freeze sim:/adder/signal_b 0000000000000001
run 20 ns
force -freeze sim:/adder/signal_a 00000001 
force -freeze sim:/adder/signal_b 0000000000000010
run 20 ns
force -freeze sim:/adder/signal_a 00000001 
force -freeze sim:/adder/signal_b 0000000000000011
run 20 ns
force -freeze sim:/adder/signal_a 00000001
force -freeze sim:/adder/signal_b 0000000000000100
run 20 ns
force -freeze sim:/adder/signal_a 00000001 
force -freeze sim:/adder/signal_b 0000000000000101
run 20 ns
force -freeze sim:/adder/signal_a 00000001 
force -freeze sim:/adder/signal_b 0000000011111111
run 20 ns