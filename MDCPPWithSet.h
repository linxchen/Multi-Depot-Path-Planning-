#include <vector>
#include <unordered_map>
using std::vector;
using std::unordered_map;

#define MAX 1000000000

class MDCPPWithSet
{
public:
	int solveMDCPP(vector<vector<int>> initialGraph, vector<int> initialSet);
	void printSomething();
	void recordData(int &pathNum, int &overlappedNum);
private:
	void storeInitialGraph(vector<vector<int>> &initialGraph, vector<int> &initialSet);
	void findOddVertices();
	void createGp();
	int solveMWPM();
	int createNewG();
	int FindMin(const vector<int> &Disk, const vector<bool> &S, int n, int &min);

	vector<vector<int>> graph;
	vector<int> depotSet;
	vector<int> oddsInComplementarySet;
	vector<vector<int>> shortestPaths;
	unordered_map<int,int> GpToInitialGraph;
	vector<int> edgesGp;
	vector<int> weightsGp;
	int cost = 0;
	unordered_map<int,int> GpMatchingRes;
};
