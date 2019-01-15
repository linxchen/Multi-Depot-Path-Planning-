reset
set key center at 60, 0.0095

set size ratio 0.8


set grid

set xlabel "Switch Number" offset 0,0.5
set ylabel "Execution Time (s)" offset 2.2,0
set yrange [0:0.011]
set xrange [10:160]
set xtics 0,20,160
plot 'data4_0.txt' using 1:($2/1000000) title"12-Depot-Number" with linespoints ls 7 pt 1 pointsize 2.5,\
'data4_1.txt' using 1:($2/1000000) title"24-Depot-Number" with linespoints ls 6 pt 6 pointsize 2.5,\
'data4_2.txt' using 1:($2/1000000) title"48-Depot-Number" with linespoints ls 5 pt 2 lc 1 pointsize 2.5

set terminal postscript eps color solid linewidth 1.2 "Helvetica" 26
set output "figure14.eps"

replot

set output
