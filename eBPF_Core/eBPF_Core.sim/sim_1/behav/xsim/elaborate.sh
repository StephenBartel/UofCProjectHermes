#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.2.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Thu Nov 26 12:35:54 MST 2020
# SW Build 2729669 on Thu Dec  5 04:48:12 MST 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto b1d78080d7e346308dc6047affadb438 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_Mult_32bit_behav xil_defaultlib.tb_Mult_32bit xil_defaultlib.glbl -log elaborate.log"
xelab -wto b1d78080d7e346308dc6047affadb438 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_Mult_32bit_behav xil_defaultlib.tb_Mult_32bit xil_defaultlib.glbl -log elaborate.log

