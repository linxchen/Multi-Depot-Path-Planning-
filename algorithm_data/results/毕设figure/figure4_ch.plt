reset
set key center at 26, 0.066

set size ratio 0.8


set grid

set xlabel "拓扑图的顶点总数" offset 0,0.5 font "Microsoft YaHei,26"
set ylabel "算法执行时间(s)" offset 2.2,0 font "Microsoft YaHei,26"

set key left
set key font ",18"

set yrange [0:0.08]
set xrange [10:272]
set xtics 0,30,272
plot 'data4_0.txt' using 1:($2/1000000) title"集合S含12个顶点" with linespoints ls 6 pt 6 pointsize 2.5,\
'data4_1.txt' using 1:($2/1000000) title"集合S含24个顶点" with linespoints ls 7 pt 1 pointsize 2.5,\
'data4_2.txt' using 1:($2/1000000) title"集合S含48个顶点" with linespoints ls 5 pt 2 lc 1 pointsize 2.5,\
'data4_3.txt' using 1:($2/1000000) title"集合S含96个顶点" with linespoints ls 4 pt 8 pointsize 2.5

set terminal pngcairo size 1024,768 color solid linewidth 2.5 font "Microsoft YaHei,20"
set output "figure4_ch.png"

replot

set output
