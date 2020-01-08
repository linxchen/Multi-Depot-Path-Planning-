reset
set key center at 150, 110

set size ratio 0.8


set grid

set xlabel "Time (s)" offset 0,0.3
set ylabel "Queue Length (packet)" offset 2.0,0

set key font ",20"

set xrange [0:28]
set yrange [0:300]
set xtics 0,2,28


# plot 'data_hop4_100Mb_5us_noiperf.txt' using ($3-1577761014.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop1_100Mb_5us_noiperf.txt' using ($3-1577761014.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1,\
 'data_hop4_100Mb_5us_iperf.txt' using ($3-1577761076.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop1_100Mb_5us_iperf.txt' using ($3-1577761076.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1

# plot 'data_hop4_100Mb_3us_noiperf_2.txt' using ($3-1577775118.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop2_100Mb_3us_noiperf_2.txt' using ($3-1577775118.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1,\
 'data_hop4_100Mb_3us_iperf_2.txt' using ($3-1577775155.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop2_100Mb_3us_iperf_2.txt' using ($3-1577775155.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1

# plot 'data_hop4_100Mb_5us_noiperf_2.txt' using ($3-1577775534.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop2_100Mb_5us_noiperf_2.txt' using ($3-1577775534.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1,\
 'data_hop4_100Mb_5us_iperf_2.txt' using ($3-1577775560.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop2_100Mb_5us_iperf_2.txt' using ($3-1577775560.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1

# plot 'data_hop4_100Mb_5us_noiperf_3.txt' using ($3-1577776790.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop1_100Mb_5us_noiperf_3.txt' using ($3-1577776790.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1,\
 'data_hop4_100Mb_5us_iperf_3.txt' using ($3-1577776837.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop1_100Mb_5us_iperf_3.txt' using ($3-1577776837.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1


# plot 'data_hop3_100Mb_8us_noiperf_1.txt' using ($3-1577780993.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop2_100Mb_8us_noiperf_1.txt' using ($3-1577780993.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1,\
 'data_hop3_100Mb_8us_iperf_1.txt' using ($3-1577781028.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop2_100Mb_8us_iperf_1.txt' using ($3-1577781028.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1

# plot 'data_hop4_50Mb_50us_noiperf_1.txt' using ($3-1577783819.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop1_50Mb_50us_noiperf_1.txt' using ($3-1577783819.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1,\
 'data_hop4_50Mb_50us_iperf_1.txt' using ($3-1577783855.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop1_50Mb_50us_iperf_1.txt' using ($3-1577783855.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1


# plot 'data_hop4_50Mb_50us_noiperf_2.txt' using ($3-1577783956.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop2_50Mb_50us_noiperf_2.txt' using ($3-1577783956.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1,\
 'data_hop4_50Mb_50us_iperf_2.txt' using ($3-1577783983.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop2_50Mb_50us_iperf_2.txt' using ($3-1577783983.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1


plot 'data_hop3_400_5_noiperf_1.txt' using ($3-1577953314.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop2_400_5_noiperf_1.txt' using ($3-1577953314.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1,\
 'data_hop3_400_5_iperf_1.txt' using ($3-1577953343.0):4 title"hop4-iperf" lc 7 pt 9 pointsize 1,\
 'data_hop2_400_5_iperf_1.txt' using ($3-1577953343.0):4 title"hop2-iperf" lc 3 pt 5 pointsize 1


set terminal postscript eps color solid linewidth 1.2 "Helvetica" 26
set output "figure_queue_321.eps"

replot

set output
