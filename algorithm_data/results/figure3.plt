reset
set key center at 53, 5

set size ratio 0.8


set grid

set xlabel "Switch Number" offset 0,0.5
set ylabel "INT Path Number" offset 2.2,0
set y2label "Overlapped Edge Number" offset -1.7,0

set key left
set key font ",20"
set y2tics
set yrange [0:15]
set y2range [0:15]
set xrange [30:160]
set xtics 0,20,160
plot 'data3.txt' using 1:2 title"MDCPP-Path-Number" with linespoints ls 7 pt 2 pointsize 2.5,\
'data3.txt' using 1:3 title"MDCPP-Overlapped-Edge-Number" with linespoints ls 6 pointsize 2.5 axes x1y2,\
'data3.txt' using 1:4 title"Euler-Path-Number" with linespoints ls 8 pt 9 lc 10 pointsize 2.5

set terminal postscript eps color solid linewidth 1.2 "Helvetica" 26
set output "figure3.eps"

replot

set output
