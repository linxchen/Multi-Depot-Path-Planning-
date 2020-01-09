reset
set key center at 0.2, 7.5

set size ratio 0.8


set grid

set xlabel "Vertex Number In Set S" offset 0,0.5
set ylabel "INT Path Number" offset 2.2,0
set y2label "Overlapped Edge Number" offset -1.8,0

set key left
set key font ",18"
set y2tics
set yrange [0:20]
set y2range [0:12]
set xrange [0:18]
set xtics 0,2,18
plot 'data10_0.txt' using 1:2 title"Path-Random" with linespoints ls 1 pt 12 pointsize 2.5,\
'data10_1.txt' using 1:2 title"Path-Even" with linespoints ls 7 pt 2 pointsize 2.5,\
'data10_2.txt' using 1:2 title"Path-Odd" with linespoints ls 3 pt 1 pointsize 2.5,\
'data10_0.txt' using 1:3 title"Overlapped-Random" with linespoints ls 7 pt 4 pointsize 2.5 axes x1y2,\
'data10_1.txt' using 1:3 title"Overlapped-Even" with linespoints ls 8 pt 6 lc 10 pointsize 2.5 axes x1y2,\
'data10_2.txt' using 1:3 title"Overlapped-Odd" with linespoints ls 6 pt 8 pointsize 2.5 axes x1y2

set terminal pngcairo size 1024,768 color solid linewidth 2.5 font "Helvetica,26"
set output "figure10.png"

replot

set output
