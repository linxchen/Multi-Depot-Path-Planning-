reset
set key center at 6, 0.9

set size ratio 0.8


set grid

set xlabel "时间(s)" offset 0,0.3 font "Microsoft YaHei,26"
set ylabel "单跳处理时延(ms)" offset 1.7,0 font "Microsoft YaHei,26"

set key font ",18"

set xrange [0:48]
set yrange [0:1.0]
set xtics 0,5,48


plot 'data_hop3_100K.txt' using ($3-1578017231.0):($4/1000.0) title"hop3" lc 7 pt 9 pointsize 1,\
 'data_hop2_100K.txt' using ($3-1578017231.0):($4/1000.0) title"hop2" lc 3 pt 5 pointsize 1


set terminal pngcairo size 1024,768 color solid linewidth 2.5 font "Microsoft YaHei,20"

set output "figure_latency_100K_ch.png"


replot

set output
