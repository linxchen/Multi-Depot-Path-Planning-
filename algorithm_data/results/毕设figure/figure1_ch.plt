reset
set key center at 7, 9

set size ratio 0.8


set grid

set xlabel "集合S的顶点数量" offset 0,0.5 font "Microsoft YaHei,26"
set ylabel "INT探测路径数量" offset 2.8,0 font "Microsoft YaHei,26"
set y2label "重复探测的边数" offset -1.8,0 font "Microsoft YaHei,26"

set key left
set key font ",18"
set y2tics
set yrange [0:10]
set xrange [0:35]
set xtics 0,5,35
plot 'data1.txt' using 1:2 title"MDCPP-set路径数量" with linespoints ls 7 pt 2 pointsize 2.5,\
'data1.txt' using 1:3 title"MDCPP-set重复探测边数" with linespoints ls 6 pointsize 2.5 axes x1y2,\
'data1.txt' using 1:4 title"INT-path路径数量" with linespoints ls 8 pt 9 lc 10 pointsize 2.5

set terminal pngcairo size 1024,768 color solid linewidth 2.5 font "Microsoft YaHei,20"
set output "figure1_ch.png"

replot

set output
