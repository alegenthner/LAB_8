force -freeze sim:/controle/control_clk 1 0, 0 {5000 ps} -r {10 ns}
force -freeze sim:/controle/control_start 0 
force -freeze sim:/controle/control_c0 0
run 10 ns
force -freeze sim:/controle/control_start 1
force -freeze sim:/controle/control_c0 1
run 10 ns
force -freeze sim:/controle/control_start 0 
force -freeze sim:/controle/control_c0 1
run 10 ns
force -freeze sim:/controle/control_start 0 
force -freeze sim:/controle/control_c0 1
run 10 ns
force -freeze sim:/controle/control_start 1 
force -freeze sim:/controle/control_c0 1
run 10 ns
force -freeze sim:/controle/control_start 0 
force -freeze sim:/controle/control_c0 0
run 10 ns

--force -freeze sim:/controle/control_start 1 
--force -freeze sim:/controle/control_c0 0
--run 10 ns
--force -freeze sim:/controle/control_start 1 
--force -freeze sim:/controle/control_c0 0
--run 10 ns
--force -freeze sim:/controle/control_start 1 
--force -freeze sim:/controle/control_c0 0