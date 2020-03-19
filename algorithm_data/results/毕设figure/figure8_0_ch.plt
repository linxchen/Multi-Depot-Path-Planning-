reset
set key center at 330, 205

set size ratio 0.8


set grid

set xlabel "FatTree拓扑图的顶点总数" offset 0,0.3 font "Microsoft YaHei,26"
set ylabel "INT探测路径数量" offset 2.0,0 font "Microsoft YaHei,26"

set key font ",18"
set yrange [0:250]
set xrange [0:1200]
set xtics 0,200,1200
plot 'data8_0.txt' using 1:2 title"MDCPP-set-20%密度" with linespoints ls 7 pt 13 pointsize 2.5,\
'data8_1.txt' using 1:2 title"MDCPP-set-50%密度" with linespoints ls 6 pt 6 pointsize 2.5,\
'data8_2.txt' using 1:2 title"MDCPP-set-80%密度" with linespoints ls 8 lc 1 pt 4 pointsize 2.5,\
'data8_0.txt' using 1:4 title"INT-path" with linespoints ls 8 pointsize 2.5


set terminal pngcairo size 1024,768 color solid linewidth 2.5 font "Microsoft YaHei,20"
set output "figure8_0_ch.png"

replot

set output
