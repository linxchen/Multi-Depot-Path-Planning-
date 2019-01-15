reset
set key center at 20, 0.03

set size ratio 0.8


set grid

set xlabel "Odd Vertex Number" offset 0,0.5
set ylabel "Execution Time (s)" offset 2.2,0
set y2label "Call Times of Hierholzer's" offset -2.2,0

set key left
set y2tics
set yrange [0:0.25]
set xrange [0:250]
set xtics 0,50,250
plot 'data4.txt' using 1:2 title"Execution Time" with linespoints ls 7 pt 2 pointsize 2.5,\
'data4.txt' using 1:3 title"Hierholzer Call Times" with linespoints ls 6 pointsize 2.5 axes x1y2

set terminal postscript eps color solid linewidth 1.2 "Helvetica" 26
set output "figure4.eps"

replot

set output
