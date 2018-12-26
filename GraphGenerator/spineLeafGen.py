#!/usr/bin/python
import sys
import random

def genSpineLeaf(swSum):  #SNum must be 3,6,9,12,15...
	sys.setrecursionlimit(1000000)

	L1 = int(swSum/3)
	L2 = L1*2

	topoList = [[0 for i in range(swSum)] for i in range(swSum)]

	for i in range(L1):
		for j in range(L1, swSum):
			topoList[i][j] = 1
			topoList[j][i] = 1

	return topoList

def createDepotSetForSpineLeaf(sNum, density):
	depotSet = [0 for i in range(sNum)]
	L1 = int(sNum/3)
	depotMax = L1*2
	depotNum = int(depotMax * density)
	start = L1
	end = sNum -1
	for i in range(depotNum):
		randomDepot = random.randint(start,end)
		while depotSet[randomDepot] == 1:
			randomDepot = random.randint(start,end)
		depotSet[randomDepot] = 1

	return depotSet

if __name__ == '__main__':
	den = 0.5
	for i in range(3, 101, 3):
		topo = genSpineLeaf(i) #SNum must be larger than 3
		depotSet = createDepotSetForSpineLeaf(i, den)
		print(topo)
		print(depotSet)
