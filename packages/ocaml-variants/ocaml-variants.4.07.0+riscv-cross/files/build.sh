#!/bin/bash

export PATH=%{build}%/install:$(PATH)
./configure -no-ocamldoc -no-debugger -prefix %{build}%/install
make -j world.opt
make install
make clean
./configure --target riscv64-unknown-linux-gnu -no-ocamldoc -no-debugger -target-bindir %{build}%/install/bin
make -j4 world || /bin/true
make -j4 opt
