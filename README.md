# FSMD-GCD
Basic Finite State Machine with Datapath (FSMD) example to calculate the Greatest Common Divisor (GCD) of two 8-bit numbers

## Install

These examples use [ModelSim and Quartus from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/ihabadly/fsmd-gcd.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd fsmd-gcd
    $ code .
    ```
    Click on the gcd_toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if x_i = 12, y_i = 8 then d_o = 4:

    ```sh
    $ vsim work.gcd_toplevel_tb
    ```
