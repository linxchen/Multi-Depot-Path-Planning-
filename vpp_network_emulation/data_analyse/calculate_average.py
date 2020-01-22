import sys

refer_time = 1578017231.0  # 100K
#refer_time = 1578018143.0    # 1M
#refer_time = 1578018462.0   # 10M

latency_3s_8s = 0
cnt_3s_8s = 0
latency_18s_23s = 0
cnt_18s_23s = 0
latency_33s_38s = 0
cnt_33s_38s = 0

file = sys.argv[1]
with open(file, 'r') as fd:
	while True:
		line = fd.readline()
		if not line:
			break
		line_list = line.split()
		timestamp = float(line_list[2]) - refer_time
		latency = int(line_list[3])
		if timestamp >= 3.0 and timestamp <=8.0:
			latency_3s_8s += latency
			cnt_3s_8s += 1
			continue
		if timestamp >= 18.0 and timestamp <= 23.0:
			latency_18s_23s += latency
			cnt_18s_23s += 1
			continue
		if timestamp >= 33.0 and timestamp <= 38.0:
			latency_33s_38s += latency
			cnt_33s_38s += 1
			continue
print "average latency (us):"
print "3s_8s: %.5f" % (float(latency_3s_8s)/cnt_3s_8s)
print "18s_23s: %.5f" % (float(latency_18s_23s)/cnt_18s_23s)
print "33s_38s: %.5f" % (float(latency_33s_38s)/cnt_33s_38s)
