reset
set key center at 30, 45

set size ratio 0.8


set grid

set xlabel "Switch Number (LeafSpine)" offset 0,0.3
set ylabel "Overlapped Edge Number" offset 1.7,0

set key font ",20"
set yrange [0:55]
set xrange [0:100]
set xtics 0,20,100
plot 'data9_0.txt' using 1:3 title"MDCPP-20%-Density" with linespoints ls 7 pt 13 pointsize 2.5,\
'data9_1.txt' using 1:3 title"MDCPP-50%-Density" with linespoints ls 6 pt 6 pointsize 2.5,\
'data9_2.txt' using 1:3 title"MDCPP-80%-Density" with linespoints ls 8 lc 1 pt 4 pointsize 2.5,\
'data9_0.txt' using 1:5 title"Euler" with linespoints ls 8 pointsize 2.5


set terminal postscript eps color solid linewidth 1.2 "Helvetica" 26
set output "figure9_1.eps"

replot

set output
