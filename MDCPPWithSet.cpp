#include "MDCPPWithSet.h"
#include "MWPM/PerfectMatching.h"

void MDCPPWithSet::storeInitialGraph(vector<vector<int>> &initialGraph, vector<int> &initialSet)
{
	graph = initialGraph;
	depotSet = initialSet;
}

void MDCPPWithSet::findOddVertices()
{
	for(int i=0; i<graph.size(); ++i)
	{
		int degree = 0;
		for(int j=0; j<graph[i].size(); ++j)
		{
			if(graph[i][j] != 0)
				++degree;
		}
		if(degree & 0x01 == 1 && depotSet[i] == 0)
			oddsInComplementarySet.push_back(i);
	}
}

void MDCPPWithSet::createGp()
{
	int verticesNum = graph.size();
	int oddsNum = oddsInComplementarySet.size();
	for(int i=0; i<oddsNum; ++i)
	{
		int sourceNode = oddsInComplementarySet[i];
		vector<bool> S(verticesNum, false);
		vector<int> Disk(verticesNum, MAX);
		vector<int> Path(verticesNum, -1);
		int toDepotSetMIN = MAX;
		int toDepotSetNode = sourceNode;

		for(int i=0; i<verticesNum; ++i)
		{
			if(graph[sourceNode][i] != 0)
			{
				Disk[i] = graph[sourceNode][i];
				Path[i] = sourceNode;
			}
		}

		S[sourceNode] = true;
		Disk[sourceNode] = 0;

		for(int t=0; t<verticesNum; ++t)
		{
			int shortestDistance = MAX;
			if((sourceNode = FindMin(Disk,S,verticesNum,shortestDistance)) == -1)
				break;
			S[sourceNode] = true;
			for(int j=0; j<verticesNum; ++j)
			{
				if(!S[j] && graph[sourceNode][j]!=0 && (Disk[j]>graph[sourceNode][j]+Disk[sourceNode]))
				{
					Disk[j] = graph[sourceNode][j]+Disk[sourceNode];
					Path[j] = sourceNode;
				}
			}

			if(depotSet[sourceNode] == 1 && toDepotSetMIN > shortestDistance)
			{
				toDepotSetMIN = shortestDistance;
				toDepotSetNode = sourceNode;
				continue;
			}
			for(int k=0; k<oddsNum; ++k)
			{
				if(oddsInComplementarySet[k] == sourceNode && k > i)
				{
					edgesGp.push_back(i);
					edgesGp.push_back(k);
					weightsGp.push_back(shortestDistance);
				}
			}
		}

		shortestPaths.push_back(Path);
		edgesGp.push_back(i);
		edgesGp.push_back(i+oddsNum);
		weightsGp.push_back(toDepotSetMIN);
		GpToInitialGraph[i] = oddsInComplementarySet[i];
		GpToInitialGraph[i+oddsNum] = toDepotSetNode;
	}

	for(int i=0; i<oddsNum; ++i)
	{
		for(int j=i+1; j<oddsNum; ++j)
		{
			edgesGp.push_back(i+oddsNum);
			edgesGp.push_back(j+oddsNum);
			weightsGp.push_back(0);
		}
	}
}

int MDCPPWithSet::FindMin(const vector<int> &Disk, const vector<bool> &S, int n, int &min)
{
	int k = 0;
	for(int i=0; i<n; ++i)
	{
		if(!S[i] && min>Disk[i])
		{
			min = Disk[i];
			k = i;
		}
	}
	if(min == MAX) return -1;
	return k;
}

int MDCPPWithSet::solveMWPM()
{
	int nodeNum = oddsInComplementarySet.size()*2;
	int edgeNum = weightsGp.size();
	int *edges = new int[2*edgeNum];
	if(edges == nullptr) return -1;
	int *weights = new int[edgeNum];
	if(weights == nullptr) return -1;

	struct PerfectMatching::Options options;
	PerfectMatching *pm = new PerfectMatching(nodeNum, edgeNum);
	for(int e=0; e<edgeNum; ++e)
	{
		pm->AddEdge(edgesGp[2*e], edgesGp[2*e+1], weightsGp[e]);
		edges[2*e] = edgesGp[2*e];
		edges[2*e+1] = edgesGp[2*e+1];
		weights[e] = weightsGp[e];
	}
	pm->options = options;
	pm->Solve();
	cost = (int)ComputePerfectMatchingCost(nodeNum, edgeNum, edges, weights, pm);
	for(int i=0; i<oddsInComplementarySet.size(); ++i)
	{
		int j = pm->GetMatch(i);
		if(i < j) GpMatchingRes[i] = j;
	}
	delete pm;
	delete [] edges;
	delete [] weights;
	return 0;
}

int MDCPPWithSet::createNewG()
{
	unordered_map<int,int>::iterator iter;
	for(iter = GpMatchingRes.begin(); iter != GpMatchingRes.end(); ++iter)
	{
		int src = (*iter).first;
		int dst = GpToInitialGraph[(*iter).second];
		int preNode = shortestPaths[src][dst];
		while(preNode != -1)
		{
			if(graph[preNode][dst] > 0)
			{
				++graph[preNode][dst];
				++graph[dst][preNode];
				dst = preNode;
				preNode = shortestPaths[src][dst];
			}
			else
			{
				return -1;
			}
		}
	}
	return 0;
}

int MDCPPWithSet::solveMDCPP(vector<vector<int>> initialGraph, vector<int> initialSet)
{
	if(initialGraph.size() == 0 || initialSet.size() == 0)
		return -1;
	storeInitialGraph(initialGraph, initialSet);
	findOddVertices();
	if(oddsInComplementarySet.size() == 0)   //there is no odds in ComplementarySet;
		return 1;
	createGp();
	if(shortestPaths.size()==0 || GpToInitialGraph.size()==0 || edgesGp.size()==0 || weightsGp.size()==0)
		return -2;
	if(solveMWPM() == -1)
		return -3;
	if(GpMatchingRes.size()==0 || cost<=0)
		return -4;
	if(createNewG() == -1)
		return -5;
	return 0;
}
