reset
set key center at 330, 330

set size ratio 0.8


set grid

set xlabel "FatTree拓扑图的顶点总数" offset 0,0.3 font "Microsoft YaHei,26"
set ylabel "重复探测的边数" offset 1.7,0 font "Microsoft YaHei,26"

set key font ",18"
set yrange [0:400]
set xrange [0:1200]
set xtics 0,200,1200
plot 'data8_0.txt' using 1:3 title"MDCPP-set-20%密度" with linespoints ls 7 pt 13 pointsize 2.5,\
'data8_1.txt' using 1:3 title"MDCPP-set-50%密度" with linespoints ls 6 pt 6 pointsize 2.5,\
'data8_2.txt' using 1:3 title"MDCPP-set-80%密度" with linespoints ls 8 lc 1 pt 4 pointsize 2.5,\
'data8_0.txt' using 1:5 title"INT-path" with linespoints ls 8 pointsize 2.5


set terminal pngcairo size 1024,768 color solid linewidth 2.5 font "Microsoft YaHei,20"
set output "figure8_1_ch.png"

replot

set output
