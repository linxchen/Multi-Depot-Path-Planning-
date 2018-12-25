#include <stdio.h>
#include "PerfectMatching.h"
int main(int argc, char* argv[])
{
	int edge_num = 9;
	int node_num = 6;
	int* edges = new int[2*edge_num];
	int* weights = new int[edge_num];
	edges[0] = 0;
	edges[1] = 1;
	weights[0] = 3;
	edges[2] = 0;
	edges[3] = 3;
	weights[1] = 10;
	edges[4] = 0;
	edges[5] = 4;
	weights[2] = 7;
	edges[6] = 1;
	edges[7] = 2;
	weights[3] = -1;
	edges[8] = 1;
	edges[9] = 4;
	weights[4] = 5;
	edges[10] = 1;
	edges[11] = 5;
	weights[5] = 4;
	edges[12] = 2;
	edges[13] = 5;
	weights[6] = -7;
	edges[14] = 3;
	edges[15] = 4;
	weights[7] = 0;
	edges[16] = 4;
	edges[17] = 5;
	weights[8] = 4;

	bool check_perfect_matching = true;
	struct PerfectMatching::Options options;
	PerfectMatching *pm = new PerfectMatching(node_num, edge_num);
	for(int e=0; e<edge_num; e++) pm->AddEdge(edges[2*e], edges[2*e+1], weights[e]);
	pm->options = options;
	pm->Solve();
	if(check_perfect_matching)
	{
		int res = CheckPerfectMatchingOptimality(node_num, edge_num, edges, weights, pm);
		printf("check optimality: res=%d (%s)\n", res, (res==0) ? "ok" : ((res==1) ? "error" : "fatal error"));
	}
	double cost = ComputePerfectMatchingCost(node_num, edge_num, edges, weights, pm);
	printf("cost = %.1f\n", cost);
	//if(save_filename) SaveMatching(node_num, pm, save_filename);

	delete pm;

	delete[] edges;
	delete[] weights;
	return 0;
}