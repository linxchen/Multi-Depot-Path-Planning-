reset
set key center at 15, 460

set size ratio 0.8


set grid


set xlabel "拓扑图的顶点总数" offset 0,0.3 font "Microsoft YaHei,26"
set ylabel "数据面探测开销(kpps)" offset 1.7,0 font "Microsoft YaHei,26"
set y2label "控制面探测开销(kpps)" offset -1.7,0 font "Microsoft YaHei,26"
set key left
set key font ",18"
set y2tics
set yrange [0:570]
set y2range [0:5]
set xrange [10:160]
set xtics 0,20,160
plot 'data2.txt' using 1:($6/10) title"MDCPP-set数据面开销" with linespoints ls 8 lc 10 pt 6 pointsize 2.5,\
'data2.txt' using 1:($5/10) title"INT-path数据面开销" with linespoints ls 7 pt 2 pointsize 2.5,\
'data2.txt' using 1:($2/10) title"MDCPP-set控制面开销" with linespoints ls 6 pt 8 pointsize 2.5 axes x1y2,\
'data2.txt' using 1:($4/10) title"INT-path控制面开销" with linespoints ls 8 lc 1 pt 4 pointsize 2.5 axes x1y2

set terminal pngcairo size 1024,768 color solid linewidth 2.5 font "Microsoft YaHei,20"
set output "figure7_ch.png"

replot

set output
