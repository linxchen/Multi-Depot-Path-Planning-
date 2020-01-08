reset
set key center at -5, 200

set size ratio 0.8


set grid


set xlabel "Switch Number" offset 0,0.3
set ylabel "Switch Overhead (kpps)" offset 1.8,0
set y2label "Controller Overhead (kpps)" offset -1.8,0
set key left
set y2tics
set yrange [0:260]
set xrange [0:100]
set xtics 0,20,100
plot 'data2.txt' using 1:($2/10) title"DFS-Euler-Switch" with linespoints ls 7 pt 2 pointsize 2.5,\
'data2.txt' using 1:($3/10) title"DFS-Controller" with linespoints ls 6 pt 6 pointsize 2.5 axes x1y2,\
'data2.txt' using 1:($4/10) title"Euler-Controller" with linespoints ls 8 lc 1 pt 4 pointsize 2.5 axes x1y2

set terminal postscript eps color solid linewidth 1.2 "Helvetica" 26
set output "figure2.eps"

replot

set output
