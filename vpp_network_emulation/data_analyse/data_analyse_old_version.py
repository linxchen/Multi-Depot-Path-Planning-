import sys

head_line_number = 4
perhop_line_number = 3
hop_number = 6
mac_map = {"mac:8:0:27:EF:C6:AC":1,
			"mac:8:0:27:70:39:2C":2,
			"mac:8:0:27:34:66:29":3,
			"mac:8:0:27:6F:8A:53":4,
			"mac:8:0:27:F8:81:A2":5,
			"mac:2:FE:B9:3C:9E:DC":6}
output_file1 = 'data_hop1_noiperf.txt'
output_file2 = 'data_hop2_noiperf.txt'
output_file3 = 'data_hop3_noiperf.txt'
output_file4 = 'data_hop4_noiperf.txt'
output_file5 = 'data_hop5_noiperf.txt'
output_file6 = 'data_hop6_noiperf.txt'


def output_data(hop_infos):
	if len(hop_infos) != hop_number:
		return
	for k in hop_infos.keys():
		if not mac_map.has_key(k):
			return
		if mac_map[k] == 1:
			with open(output_file1, 'w') as fd1:
				pkt_cnt = 1
				for pkt_list in hop_infos[k]:
					s = str(pkt_cnt) + ' ' + ' '.join(pkt_list) + '\n'
					fd1.write(s)
					pkt_cnt += 1
		elif mac_map[k] == 2:
			with open(output_file2, 'w') as fd2:
				pkt_cnt = 1
				for pkt_list in hop_infos[k]:
					s = str(pkt_cnt) + ' ' + ' '.join(pkt_list) + '\n'
					fd2.write(s)
					pkt_cnt += 1
		elif mac_map[k] == 3:
			with open(output_file3, 'w') as fd3:
				pkt_cnt = 1
				for pkt_list in hop_infos[k]:
					s = str(pkt_cnt) + ' ' + ' '.join(pkt_list) + '\n'
					fd3.write(s)
					pkt_cnt += 1
		elif mac_map[k] == 4:
			with open(output_file4, 'w') as fd4:
				pkt_cnt = 1
				for pkt_list in hop_infos[k]:
					s = str(pkt_cnt) + ' ' + ' '.join(pkt_list) + '\n'
					fd4.write(s)
					pkt_cnt += 1
		elif mac_map[k] == 5:
			with open(output_file5, 'w') as fd5:
				pkt_cnt = 1
				for pkt_list in hop_infos[k]:
					s = str(pkt_cnt) + ' ' + ' '.join(pkt_list) + '\n'
					fd5.write(s)
					pkt_cnt += 1
		elif mac_map[k] == 6:
			with open(output_file6, 'w') as fd6:
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
					if j == 1:
						line_eles = line.split()
						mac = line_eles[2]
						egr_queue = line_eles[3].split(':')[1]
						latency = str(int(float(line_eles[4].split(':')[1])*1000000))
					elif j == 2:
						line_eles = line.split()
						ingr_time = str(int(float(line_eles[0].split(':')[1])*1000000))
						egr_time = str(int(float(line_eles[1].split(':')[1])*1000000))
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
	output_data(hop_infos)

if __name__ == '__main__':
	main()
