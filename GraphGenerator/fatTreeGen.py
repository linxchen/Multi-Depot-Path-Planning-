#!/usr/bin/python
import sys
import random

def genFatTree(podsNum):     #podsNum is 2,3,4...
	sys.setrecursionlimit(1000000)

	L1 = (podsNum/2)*(podsNum/2)
	L2 = (podsNum/2)*podsNum
	L3 = L2

	swSum = L1 + L2 + L3

	topoList = [[0 for i in range(swSum)] for i in range(swSum)]
	hostList = [0 for i in range(swSum)]
	linkNum = 0

	core = [0 for i in range(L1)]
	agg = [0 for i in range(L2)]
	edg = [0 for i in range(L3)]

	# add core switches
	for i in range(L1):
		core[i] = i
	# add aggregation switches
	for i in range(L2):
		agg[i] = L1 + i
	# add edge switches
	for i in range(L3):
		edg[i] = L1 + L2 + i

	for i in range(podsNum/2):
		for j in range(podsNum):
			# add links between aggregation and core switches
			for k in range(podsNum/2*i, podsNum/2*(i+1)):
				topoList[agg[podsNum/2*j+i]][core[k]] = 1
				topoList[core[k]][agg[podsNum/2*j+i]] = 1
				linkNum += 2
			# add links between aggregation and edge switches
			for m in range(podsNum/2):
				topoList[agg[podsNum/2*j+i]][edg[podsNum/2*j+m]] = 1
				topoList[edg[podsNum/2*j+m]][agg[podsNum/2*j+i]] = 1
				linkNum += 2

	# hostList
	for i in range((L1+L2), swSum):
		hostList[i] = 1

	return topoList, hostList,swSum


# def genFatTreeWrong(swSum):  #SNum must be 10,15,20,25,30...
# 	sys.setrecursionlimit(1000000)

# 	L1 = int(swSum/5)
# 	L2 = L1*2
# 	L3 = L2

# 	topoList = [[0 for i in range(swSum)] for i in range(swSum)]
# 	hostList = [0 for i in range(swSum)]
# 	linkNum = 0

# 	core = [0 for i in range(L1)]
# 	agg = [0 for i in range(L2)]
# 	edg = [0 for i in range(L3)]

# 	# add core switches
# 	for i in range(L1):
# 		core[i] = i

# 	# add aggregation switches
# 	for i in range(L2):
# 		agg[i] = L1 + i

# 	# add edge switches
# 	for i in range(L3):
# 		edg[i] = L1 + L2 + i

# 	# add links between core and aggregation switches
# 	for i in range(L1):
# 		for j in agg[:]:
# 			topoList[core[i]][j] = 1
# 			topoList[j][core[i]] = 1
# 			linkNum += 2

# 	# add links between aggregation and edge switches
# 	for step in range(0, L2, 2):
# 		for i in agg[step:step+2]:
# 			for j in edg[step:step+2]:
# 				topoList[i][j] = 1
# 				topoList[j][i] = 1
# 				linkNum += 2
# 	# hostList
# 	for i in range((L1+L2), swSum):
# 		hostList[i] = 1

# 	return topoList, hostList


def createDepotSetForFatTree(hostList, density):
	depotSet = [0 for i in range(len(hostList))]
	depotMax = 0
	for i in range(len(hostList)):
		if hostList[i] == 1:
			depotMax += 1
	depotNum = int(depotMax * density)
	start = len(hostList) - depotMax
	end = len(hostList) -1
	for i in range(depotNum):
		randomDepot = random.randint(start,end)
		while depotSet[randomDepot] == 1:
			randomDepot = random.randint(start,end)
		depotSet[randomDepot] = 1

	return depotSet

def calEulerPathNum(topoMatrix, sNum):
	count = 0
	for i in range(sNum):
		degreeSum = 0
		for j in range(sNum):
			degreeSum += topoMatrix[i][j]
		if degreeSum%2 == 1:
			count += 1
	if count == 0:
		count = 1
	else:
		count /= 2
	return count

if __name__ == '__main__':
	den = 0.8         #set depot density
	for i in range(2, 22):       #set podsNum
		topo, host, sNum = genFatTree(i)    #podsNum must be larger than 2
		depotSet = createDepotSetForFatTree(host, den)
		eulerPathCount = calEulerPathNum(topo, sNum)
		print(topo)
		print(depotSet)
		print(eulerPathCount)
