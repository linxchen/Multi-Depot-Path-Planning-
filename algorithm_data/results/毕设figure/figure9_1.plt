reset
set key center at 350, 540

set size ratio 0.8


set grid

set xlabel "Switch Number (LeafSpine)" offset 0,0.3
set ylabel "Overlapped Edge Number" offset 1.7,0

set key font ",18"
set yrange [0:650]
set xrange [0:1200]
set xtics 0,200,1200
plot 'data9_0.txt' using 1:3 title"MDCPP-20%-Density" with linespoints ls 7 pt 13 pointsize 2.5,\
'data9_1.txt' using 1:3 title"MDCPP-50%-Density" with linespoints ls 6 pt 6 pointsize 2.5,\
'data9_2.txt' using 1:3 title"MDCPP-80%-Density" with linespoints ls 8 lc 1 pt 4 pointsize 2.5,\
'data9_0.txt' using 1:5 title"Euler" with linespoints ls 8 pointsize 2.5


set terminal pngcairo size 1024,768 color solid linewidth 2.5 font "Helvetica,26"
set output "figure9_1.png"

replot

set output
