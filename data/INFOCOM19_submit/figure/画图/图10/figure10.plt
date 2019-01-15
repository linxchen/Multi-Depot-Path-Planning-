reset
set key center at 440, 4000

set size ratio 0.8


set grid

set xlabel "INT Probe Speed (pps)" offset 0,0.3
set ylabel "End-to-End Latency (us)" offset 1.5,0
set yrange [-1000:15000]
set xrange [-50:600]
set xtics -50,100,600


plot 'data10.txt' using 1:2 title"Bg:2000pps" with linespoints ls 4 lc 7 pointsize 2.5,\
'data10.txt' using 1:3 title"Bg:1000pps" with linespoints ls 6 pointsize 2.5,\
'data10.txt' using 1:4 title"Bg:833pps" with linespoints ls 10 pointsize 2.5,\
'data10.txt' using 1:5 title"Bg:666pps" with linespoints ls 8 pointsize 2.5,\
'data10.txt' using 1:6 title"Bg:588pps" with linespoints ls 1 pointsize 2.5

set arrow from 330,0 to 280, 0  lc rgb "red"

set label "Comfort Zone" at 350, 0 tc lt 7



set terminal postscript eps color solid linewidth 1.2 "Helvetica" 26
set output "figure10.eps"

replot

set output
