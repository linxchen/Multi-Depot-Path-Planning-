reset
set key center at 50, 0.45

set size ratio 0.8


set grid

set xlabel "Switch Number" offset 0,0.5
set ylabel "Execution Time (s)" offset 2.2,0

set key left
set key font ",18"

set yrange [0:0.55]
set xrange [10:520]
set xtics 0,50,520
plot 'data4_0.txt' using 1:($2/1000000) title"12-Depot-Number" with linespoints lt 2 pt 4 pointsize 2,\
'data4_1.txt' using 1:($2/1000000) title"24-Depot-Number" with linespoints lt 7 pt 6 pointsize 2,\
'data4_2.txt' using 1:($2/1000000) title"48-Depot-Number" with linespoints lt 6 pt 1 pointsize 2,\
'data4_3.txt' using 1:($2/1000000) title"96-Depot-Number" with linespoints lt 4 pt 8 pointsize 2

set terminal pngcairo size 1024,768 color solid linewidth 2.5 font "Helvetica,26"
set output "figure4_multiple.png"

replot

set output
