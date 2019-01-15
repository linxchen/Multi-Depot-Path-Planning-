reset
set key center at 0, 17

set size ratio 0.8


set grid

set xlabel "Edge Number" offset 0,0.5
set ylabel "INT Path Number" offset 1.7,0
set y2label "Overlapped Edge Number" offset -1.7,0

set key left
set key font ",20"
set y2tics
set yrange [0:20]
set y2range [0:20]
set xrange [0:750]
set xtics 0,100,750
plot 'data5.txt' using 1:2 title"MDCPP-Path-Number" with linespoints ls 7 pt 2 pointsize 2.5,\
'data5.txt' using 1:3 title"MDCPP-Overlapped-Edge-Number" with linespoints ls 6 pointsize 2.5 axes x1y2,\
'data5.txt' using 1:4 title"Euler-Path-Number" with linespoints ls 8 pt 9 lc 10 pointsize 2.5

set terminal postscript eps color solid linewidth 1.2 "Helvetica" 26
set output "figure15.eps"

replot

set output
