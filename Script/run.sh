verilator --binary -j 0 --Wall mux4x1.v decoder2x4.v register.v upcounter.v add.v svm.v svm_tb.v -top svm_tb --timing --CFLAGS "-std=c++20" --trace

cd obj_dir

make -f Vsvm_tb.mk Vsvm_tb

./Vsvm_tb

gtkwave svm.vcd
