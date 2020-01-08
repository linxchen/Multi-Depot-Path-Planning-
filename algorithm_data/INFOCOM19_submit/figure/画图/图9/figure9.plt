reset
set key center at 10, 18

set size ratio 0.8


set grid

set xlabel "Switch Number" offset 0,0.3
set ylabel "Variance of Path Lengths" offset 1.5,0
set yrange [-3:20]
set xrange [3:30]
set xtics 0,5,30
plot 'data9.txt' using 1:2 title"Balance" with linespoints ls 7 pt 13 pointsize 2.5,\
'data9.txt' using 1:3 title"Unbalance" with linespoints ls 6 pt 6 pointsize 2.5

set terminal postscript eps color solid linewidth 1.2 "Helvetica" 26
set output "figure9.eps"

replot

set output
