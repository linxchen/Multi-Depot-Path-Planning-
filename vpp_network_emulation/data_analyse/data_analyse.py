import sys

head_line_number = 2
perhop_line_number = 3
hop_number = 6
mac_map = {"8:0:27:35:6D:62":1,
			"8:0:27:A8:B3:6A":2,
			"8:0:27:8C:77:3F":3,
			"8:0:27:2A:85:1C":4,
			"8:0:27:32:A5:E1":5,
			"8:0:27:12:50:9C":6}
output_file1 = 'data_hop1_'
output_file2 = 'data_hop2_'
output_file3 = 'data_hop3_'
output_file4 = 'data_hop4_'
output_file5 = 'data_hop5_'
output_file6 = 'data_hop6_'


def output_data(data_path, hop_infos):
	if len(hop_infos) != hop_number:
		return
	path_suffix = data_path.split('/')[-1]
	for k in hop_infos.keys():
		if not mac_map.has_key(k):
			return
		if mac_map[k] == 1:
			with open(output_file1+path_suffix, 'w') as fd1:
				pkt_cnt = 1
				for pkt_list in hop_infos[k]:
					s = str(pkt_cnt) + ' ' + ' '.join(pkt_list) + '\n'
					fd1.write(s)
					pkt_cnt += 1
		elif mac_map[k] == 2:
			with open(output_file2+path_suffix, 'w') as fd2:
				pkt_cnt = 1
				for pkt_list in hop_infos[k]:
					s = str(pkt_cnt) + ' ' + ' '.join(pkt_list) + '\n'
					fd2.write(s)
					pkt_cnt += 1
		elif mac_map[k] == 3:
			with open(output_file3+path_suffix, 'w') as fd3:
				pkt_cnt = 1
				for pkt_list in hop_infos[k]:
					s = str(pkt_cnt) + ' ' + ' '.join(pkt_list) + '\n'
					fd3.write(s)
					pkt_cnt += 1
		elif mac_map[k] == 4:
			with open(output_file4+path_suffix, 'w') as fd4:
				pkt_cnt = 1
				for pkt_list in hop_infos[k]:
					s = str(pkt_cnt) + ' ' + ' '.join(pkt_list) + '\n'
					fd4.write(s)
					pkt_cnt += 1
		elif mac_map[k] == 5:
			with open(output_file5+path_suffix, 'w') as fd5:
				pkt_cnt = 1
				for pkt_list in hop_infos[k]:
					s = str(pkt_cnt) + ' ' + ' '.join(pkt_list) + '\n'
					fd5.write(s)
					pkt_cnt += 1
		elif mac_map[k] == 6:
			with open(output_file6+path_suffix, 'w') as fd6:
				pkt_cnt = 1
				for pkt_list in hop_infos[k]:
					s = str(pkt_cnt) + ' ' + ' '.join(pkt_list) + '\n'
					fd6.write(s)
					pkt_cnt += 1


def parse_data(data_path, hop_infos):
	with open(data_path, 'r') as fd:
		while True:
			for i in range(head_line_number):
				line = fd.readline()
				if not line:
					return
			for i in range(hop_number):
				mac = ""
				ingr_time = ""
				egr_time = ""
				egr_queue = ""
				latency = ""
				for j in range(perhop_line_number):
					line = fd.readline()
					if not line:
						return
					if j == 1:
						line_eles = line.split()
						mac = line_eles[1]
						egr_queue = line_eles[3]
						latency = str(int(float(line_eles[5])*1000000))
					elif j == 2:
						line_eles = line.split()
						ingr_time = str(int(float(line_eles[1])*1000000))
						egr_time = str(int(float(line_eles[3])*1000000))
				if not hop_infos.has_key(mac):
					hop_infos[mac] = []
				hop_infos[mac].append([ingr_time, egr_time, egr_queue, latency])

def main():
	if len(sys.argv) != 2:
		return
	data_path = sys.argv[1]
	#print data_path
	hop_infos = {}
	parse_data(data_path, hop_infos)
	output_data(data_path, hop_infos)

if __name__ == '__main__':
	main()
