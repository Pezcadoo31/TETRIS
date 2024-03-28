onerror {exit -code 1}
vlib work
vcom -work work DIVISOR_FRECUENCIA_25HZ.vho
vcom -work work DIVISOR_FRECUENCIA_25HZ.vwf.vht
vsim -novopt -c -t 1ps -L fiftyfivenm -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.DIVISOR_FRECUENCIA_25HZ_vhd_vec_tst
vcd file -direction DIVISOR_FRECUENCIA_25HZ.msim.vcd
vcd add -internal DIVISOR_FRECUENCIA_25HZ_vhd_vec_tst/*
vcd add -internal DIVISOR_FRECUENCIA_25HZ_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
