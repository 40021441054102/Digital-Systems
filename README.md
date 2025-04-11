# Digital Systems Course
Digital Systems Exercises, Papers and Other Stuff

Teacher : Dr. Mohammad Hamghalam
Student : Ramtin Kosari

# Prerequisites
```bash
sudo apt update
sudo apt install ghdl gtkwave
```

# How to Run Projects ?
I compile, run and visualize my projects in linux operating system and here is a guide to run projects on this repository :
1. Each exercise in this repository has ```main vhdl file``` and ```testbench vhdl file```.
2. There are 4 steps to see results, analyze, compile, run and visualize
3. Analyze :
    ```bash
    ghdl -a [main vhdl file].vhdl
    ghdl -a [testbench file].vhdl
    ```
5. Compile :
    ```bash
    ghdl -e [testbench file]
    ```
6. Run :
    ```bash
    ghdl -r [testbench file] --vcd=wave.vcd
    ```
8. Visuzalize :
   ```bash
   gtkwave wave.vcd
   ```
That's it !
