#!/usr/bin/env bash
# Copyright (C) 2020 Pavel Kryukov, MIPT-MIPS Project
#
# This script is intended to be used with CI systems, please do not run it manually.

export MIPT_V=$1

run_test()
{
    echo -n "running $2 on ISA $1..."
    echo $3 | $MIPT_V -f -I $1 -b $2 --mars && echo " success" || exit 1
}

run_test riscv64 sum.out "3 4"
run_test riscv64 rv32-scall "81"
