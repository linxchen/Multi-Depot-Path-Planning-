reset
set key center at 15, 460

set size ratio 0.8


set grid


set xlabel "Switch Number" offset 0,0.3
set ylabel "Switch Overhead (kpps)" offset 1.7,0
set y2label "Controller Overhead (kpps)" offset -1.7,0
set key left
set key font ",18"
set y2tics
set yrange [0:570]
set y2range [0:5]
set xrange [10:160]
set xtics 0,20,160
plot 'data2.txt' using 1:($6/10) title"MDCPP-Switch" with linespoints ls 8 lc 10 pt 6 pointsize 2.5,\
'data2.txt' using 1:($5/10) title"Euler-Switch" with linespoints ls 7 pt 2 pointsize 2.5,\
'data2.txt' using 1:($2/10) title"MDCPP-Controller" with linespoints ls 6 pt 8 pointsize 2.5 axes x1y2,\
'data2.txt' using 1:($4/10) title"Euler-Controller" with linespoints ls 8 lc 1 pt 4 pointsize 2.5 axes x1y2

set terminal pngcairo size 1024,768 color solid linewidth 2.5 font "Helvetica,26"
set output "figure7.png"

replot

set output
