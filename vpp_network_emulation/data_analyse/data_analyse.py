import sys

head_line_number = 2
perhop_line_number = 4
hop_number = 4
mac_map = {"8:0:27:B5:C0:42":1,
			"8:0:27:2:FC:D9":2,
			"8:0:27:9:74:C4":3,
			"8:0:27:F3:46:4D":4}
output_file1 = 'data_hop1_'
output_file2 = 'data_hop2_'
output_file3 = 'data_hop3_'
output_file4 = 'data_hop4_'


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
				ingr_time_s = ""
				ingr_time_us = ""
				ingr_time = ""
				egr_time_s = ""
				egr_time_us = ""
				egr_time = ""
				latency = ""
				for j in range(perhop_line_number):
					line = fd.readline()
					if not line:
						return
					if j == 1:
						line_eles = line.split()
						mac = line_eles[1]
						latency = line_eles[3]
					elif j == 2:
						line_eles = line.split()
						ingr_time_s = line_eles[1]
						ingr_time_us = line_eles[3]
						ingr_time = "%.6f"%(float(int(ingr_time_s)*1000000 + int(ingr_time_us))/1000000)
					elif j == 3:
						line_eles = line.split()
						egr_time_s = line_eles[1]
						egr_time_us = line_eles[3]
						egr_time = "%.6f"%(float(int(egr_time_s)*1000000 + int(egr_time_us))/1000000)
				if not hop_infos.has_key(mac):
					hop_infos[mac] = []
				hop_infos[mac].append([ingr_time, egr_time, latency])

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
