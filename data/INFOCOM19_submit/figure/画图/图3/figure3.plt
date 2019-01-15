reset
set key center at 40, 0.006

set size ratio 0.8


set grid

set xlabel "Switch Number" offset 0,0.5
set ylabel "Execution Time (s)" offset 2.2,0
set yrange [0:0.008]
set xrange [19:101]
set xtics 20,20,100
plot 'data3.txt' using 1:2 title"DFS-10-Odd" with linespoints ls 7 pt 1 pointsize 2.5,\
'data3.txt' using 1:3 title"Euler-10-Odd" with linespoints ls 6 pt 6 pointsize 2.5,\
'data3.txt' using 6:4 title"DFS-20-Odd" with linespoints ls 5 pt 2 lc 1 pointsize 2.5,\
'data3.txt' using 6:5 title"Euler-20-Odd" with linespoints ls 8 pt 9 lc 10 pointsize 2.5

set terminal postscript eps color solid linewidth 1.2 "Helvetica" 26
set output "figure3.eps"

replot

set output
