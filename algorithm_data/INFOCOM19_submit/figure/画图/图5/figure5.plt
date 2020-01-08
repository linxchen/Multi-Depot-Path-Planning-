reset
set key center at 200, 30

set size ratio 0.8


set grid

set xlabel "Edge Number" offset 0,0.3
set ylabel "INT Path Number" offset 1.5,0
set yrange [0:35]
set xrange [0:750]
set xtics 0,100,750
plot 'data5.txt' every 5 using 1:2 title"DFS" with linespoints ls 7 pt 13 pointsize 2.5,\
'data5.txt' every 5 using 1:3 title"Euler" with linespoints ls 6 pt 6 pointsize 2.5

set terminal postscript eps color solid linewidth 1.2 "Helvetica" 26
set output "figure5.eps"

replot

set output
