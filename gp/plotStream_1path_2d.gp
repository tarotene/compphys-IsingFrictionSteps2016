set terminal postscript eps enhanced color

set xtics 25
set mxtics 10
set grid xtics
set grid ytics
set xtics font ",28" offset 0,-1
set ytics font ",28" offset -2,0
set xlabel "Time" font ",28" offset 0,-3
set ylabel "Energy" font ",28" offset -6,0
set bmargin at screen 0.20
set tmargin at screen 0.90
set lmargin at screen 0.20
set rmargin at screen 0.90

set nokey

set xrange [100:200]
set yrange [-425:-415]
set output "1pass.eps"
plot "dat/stream.dat" u ($1/400):2 smooth unique lw 2 lc rgb "red"

set xtics 5
set mxtics 5
set xrange [100:125]
set output "1pass_nonstationary.eps"
plot "dat/stream.dat" u ($1/400):2 smooth unique lw 2 lc rgb "red"

set xrange [150:175]
set output "1pass_stationary.eps"
plot "dat/stream.dat" u ($1/400):2 smooth unique lw 2 lc rgb "red"
