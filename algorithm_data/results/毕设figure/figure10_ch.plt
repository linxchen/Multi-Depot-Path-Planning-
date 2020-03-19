reset
set key center at -1.5, 7.5

set size ratio 0.8


set grid

set xlabel "集合S的顶点数量" offset 0,0.5 font "Microsoft YaHei,26"
set ylabel "INT探测路径数量" offset 2.2,0 font "Microsoft YaHei,26"
set y2label "重复探测的边数" offset -1.8,0 font "Microsoft YaHei,26"

set key left
set key font ",18"
set y2tics
set yrange [0:20]
set y2range [0:12]
set xrange [0:18]
set xtics 0,2,18
plot 'data10_0.txt' using 1:2 title"路径数量-Random" with linespoints ls 1 pt 12 pointsize 2.5,\
'data10_1.txt' using 1:2 title"路径数量-Even" with linespoints ls 7 pt 2 pointsize 2.5,\
'data10_2.txt' using 1:2 title"路径数量-Odd" with linespoints ls 3 pt 1 pointsize 2.5,\
'data10_0.txt' using 1:3 title"重复探测边数-Random" with linespoints ls 7 pt 4 pointsize 2.5 axes x1y2,\
'data10_1.txt' using 1:3 title"重复探测边数-Even" with linespoints ls 8 pt 6 lc 10 pointsize 2.5 axes x1y2,\
'data10_2.txt' using 1:3 title"重复探测边数-Odd" with linespoints ls 6 pt 8 pointsize 2.5 axes x1y2

set terminal pngcairo size 1024,768 color solid linewidth 2.5 font "Microsoft YaHei,20"
set output "figure10_ch.png"

replot

set output
