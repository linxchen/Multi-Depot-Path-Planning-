reset
set key center at 350, 210

set size ratio 0.8


set grid

set xlabel "Switch Number (FatTree)" offset 0,0.3
set ylabel "INT Path Number" offset 2.0,0

set key font ",20"
set yrange [0:250]
set xrange [0:1200]
set xtics 0,200,1200
plot 'data8_0.txt' using 1:2 title"MDCPP-20%-Density" with linespoints ls 7 pt 13 pointsize 2.5,\
'data8_1.txt' using 1:2 title"MDCPP-50%-Density" with linespoints ls 6 pt 6 pointsize 2.5,\
'data8_2.txt' using 1:2 title"MDCPP-80%-Density" with linespoints ls 8 lc 1 pt 4 pointsize 2.5,\
'data8_0.txt' using 1:4 title"Euler" with linespoints ls 8 pointsize 2.5


set terminal postscript eps color solid linewidth 1.2 "Helvetica" 26
set output "figure8_0.eps"

replot

set output
