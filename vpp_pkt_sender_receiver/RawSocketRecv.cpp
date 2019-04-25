#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <netinet/if_ether.h>

#define IPPROTO_INWT 200

typedef struct
{
	/* No option (0000 0001), a padding character*/
	unsigned char nop;
	/* Option code (ssr is 137) */
	unsigned char code;
	/* Total length of option header in one byte unit, including the first 4 bytes */
	unsigned char length;
	/* Pointer is next available slot in one byte unit, the pointer to the first address is 4 */
	unsigned char pointer;

	/* The DIP elts */
	unsigned char dip_array[0];
} __attribute__ ((packed)) ip4_inwt_ip4option_sr_header_t;

typedef struct
{
	unsigned char type;
	unsigned char shim_header_reserved;
	unsigned char length;
	unsigned char next_protocol;

	unsigned char flags[2];
	unsigned char metadata_length_of_per_hop;
	unsigned char pointer_to_hops;

	unsigned char instruction_bitmap[2];
	unsigned char metadata_header_reserved[2];

	unsigned char metadata_stack[0];
} __attribute__ ((packed)) ip4_inwt_int_header_t;

typedef struct
{
	unsigned int egress_queue_size;
	unsigned int switch_latency;
	unsigned long long ingress_timestamp;
	unsigned long long egress_timestamp;
	unsigned char link_src_mac[6];
} link_infos;

int main(int argc, char **argv)
{
	int sock, n;
	char buffer[1024];
	struct ethhdr *eth;
	struct iphdr *iph;

	// if (0 > (sock = socket(AF_INET, SOCK_RAW, IPPROTO_IP))) {
	if (0 > (sock = socket(PF_PACKET, SOCK_RAW, htons(ETH_P_IP)))) {
		perror("socket");
		exit(1);
	}

	while (1) {
		n = recvfrom(sock, buffer, 1024, 0, NULL, NULL);
		eth = (struct ethhdr*)buffer;
		iph = (struct iphdr*)(buffer + sizeof(struct ethhdr));
		if(iph->protocol == IPPROTO_INWT) {
			printf("=====================================\n");
			printf("%d bytes read\n", n);
			
			// print src_ip and dst_ip
			unsigned char *sd, *dd;
			sd = (unsigned char*)&iph->saddr;
			dd = (unsigned char*)&iph->daddr;
			// printf("Source Host: %d.%d.%d.%d Dest host: %d.%d.%d.%d\n", sd[0], sd[1], sd[2], sd[3], dd[0], dd[1], dd[2], dd[3]);
			
			// point to metadata in the inwt_int_header
			unsigned char *p_metadata;
			ip4_inwt_ip4option_sr_header_t *p_sr;
			ip4_inwt_int_header_t *p_int;
			unsigned int metadata_length_of_per_hop = 0;
			unsigned int metadata_length_left = 0;
			unsigned int count_switch = 0;

			p_sr = (ip4_inwt_ip4option_sr_header_t *) (iph + 1);
			p_int = (ip4_inwt_int_header_t *) (((void *) p_sr) + p_sr->length);
			p_metadata = (unsigned char *) (((void *) p_int) + sizeof(ip4_inwt_int_header_t));
			metadata_length_of_per_hop = (unsigned int) p_int->metadata_length_of_per_hop;
			metadata_length_left = (unsigned int) p_int->length - sizeof(ip4_inwt_int_header_t);
			while(metadata_length_left > 0) {
				count_switch++;
				metadata_length_left -= metadata_length_of_per_hop;

				link_infos link;
				unsigned int *p32 = NULL;
				unsigned long long *p64 = NULL;

				p32 = (unsigned int *) ((void *) p_metadata);
				link.egress_queue_size = *p32;
				p_metadata = (unsigned char *) (((void *) p_metadata) + sizeof(unsigned int));

				p32 = (unsigned int *) ((void *) p_metadata);
				link.switch_latency = *p32;
				p_metadata = (unsigned char *) (((void *) p_metadata) + sizeof(unsigned int));

				p64 = (unsigned long long *) ((void *) p_metadata);
				link.ingress_timestamp = *p64;
				p_metadata = (unsigned char *) (((void *) p_metadata) + sizeof(unsigned long long));

				p64 = (unsigned long long *) ((void *) p_metadata);
				link.egress_timestamp = *p64;
				p_metadata = (unsigned char *) (((void *) p_metadata) + sizeof(unsigned long long));

				for(unsigned int i=0; i<6; ++i) {
					link.link_src_mac[i] = *p_metadata;
					p_metadata++;
				}

				printf("%d switch hop info:\n", count_switch);
				printf("    link src mac:%X:%X:%X:%X:%X:%X    egress_queue_size:%u    switch_latency:%u\n",
					link.link_src_mac[0], link.link_src_mac[1], link.link_src_mac[2],
					link.link_src_mac[3], link.link_src_mac[4], link.link_src_mac[5],
					link.egress_queue_size, link.switch_latency);
				printf("    ingress_timestamp:%llu    egress_timestamp:%llu\n",
					link.ingress_timestamp, link.egress_timestamp);
			}
		}

		// //接收到的数据帧头6字节是目的MAC地址，紧接着6字节是源MAC地址。
		// eth = (struct ethhdr*)buffer;
		// printf("Dest MAC addr:%02x:%02x:%02x:%02x:%02x:%02x\n",eth->h_dest[0],eth->h_dest[1],eth->h_dest[2],eth->h_dest[3],eth->h_dest[4],eth->h_dest[5]);
		// printf("Source MAC addr:%02x:%02x:%02x:%02x:%02x:%02x\n",eth->h_source[0],eth->h_source[1],eth->h_source[2],eth->h_source[3],eth->h_source[4],eth->h_source[5]);

		// iph = (struct iphdr*)(buffer + sizeof(struct ethhdr));
		// //我们只对IPV4且没有选项字段的IPv4报文感兴趣
		// if(iph->version == 4 && iph->ihl == 5){
		// 	unsigned char *sd, *dd;
		// 	sd = (unsigned char*)&iph->saddr;
		// 	dd = (unsigned char*)&iph->daddr;
		// 	printf("Source Host: %d.%d.%d.%d Dest host: %d.%d.%d.%d\n", sd[0], sd[1], sd[2], sd[3], dd[0], dd[1], dd[2], dd[3]);
		// //    printf("Source host:%s\n", inet_ntoa(iph->saddr));
		// //    printf("Dest host:%s\n", inet_ntoa(iph->daddr));
		// }
	}
	return 0;
}