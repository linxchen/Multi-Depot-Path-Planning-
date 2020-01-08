reset
set key center at 120, 17

set size ratio 0.8


set grid

set xlabel "Switch Number" offset 0,0.3
set ylabel "INT Path Number" offset 1.5,0
set yrange [9:18]
set xrange [30:150]
set xtics 0,20,150
plot 'data6.txt' using 1:2 title"DFS" with linespoints ls 7 pt 13 pointsize 2.5,\
'data6.txt' using 1:3 title"Euler" with linespoints ls 6 pt 6 pointsize 2.5

set terminal postscript eps color solid linewidth 1.2 "Helvetica" 26
set output "figure6.eps"

replot

set output
