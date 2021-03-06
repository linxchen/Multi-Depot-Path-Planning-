reset
set key center at 26, 0.066

set size ratio 0.8


set grid

set xlabel "Switch Number" offset 0,0.5
set ylabel "Execution Time (s)" offset 2.2,0

set key left
set key font ",18"

set yrange [0:0.08]
set xrange [10:272]
set xtics 0,30,272
plot 'data4_0.txt' using 1:($2/1000000) title"12-Vertex-Num-In-Set-S" with linespoints ls 6 pt 6 pointsize 2.5,\
'data4_1.txt' using 1:($2/1000000) title"24-Vertex-Num-In-Set-S" with linespoints ls 7 pt 1 pointsize 2.5,\
'data4_2.txt' using 1:($2/1000000) title"48-Vertex-Num-In-Set-S" with linespoints ls 5 pt 2 lc 1 pointsize 2.5,\
'data4_3.txt' using 1:($2/1000000) title"96-Vertex-Num-In-Set-S" with linespoints ls 4 pt 8 pointsize 2.5

set terminal pngcairo size 1024,768 color solid linewidth 2.5 font "Helvetica,26"
set output "figure4.png"

replot

set output
