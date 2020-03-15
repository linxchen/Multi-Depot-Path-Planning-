reset
set key center at 20, 80

set size ratio 0.8


set grid

set xlabel "Packet Sending Rate (Mbps)" offset 0,0.3
set ylabel "CPU Usage of VPP Application (%)" offset 2.0,0

set key font ",18"
set yrange [0:100]
set xrange [0:70]
set xtics 0,10,70
plot 'data_cpu.txt' using 1:2 title"INT Packet with SR Label" with linespoints ls 7 pt 13 pointsize 2.5,\
'data_cpu.txt' using 1:3 title"Normal UDP Packet" with linespoints ls 6 pt 6 pointsize 2.5

set terminal pngcairo size 1024,768 color solid linewidth 2.5 font "Helvetica,26"
set output "figure_cpu.png"

replot

set output
