#!/usr/bin/python
import random
import sys

def createRandomTopo(sNum):
	sys.setrecursionlimit(1000000)
	#create adjaMatrix
	topoMatrix = [[0 for i in range(sNum)] for i in range(sNum)]
	visited = [0 for i in range(sNum)]
	#create topo randomly
	for i in range(sNum):
		for j in range(i+1, sNum):
			link = random.randint(0,1)
			topoMatrix[i][j] = link
			topoMatrix[j][i] = link
	#DFS
	def DFS(v):
		visited[v] = 1
		for j in range(sNum):
			if topoMatrix[v][j] == 1 and visited[j] == 0:
				DFS(j)
	#check the network connectivity using DFS
	disconNode = []
	for i in range(sNum):
		if visited[i] == 0:
			DFS(i)
			disconNode.append(i)
	#if the network is unconnected, connect each disconNode
	for i in range(len(disconNode)-1):
		topoMatrix[disconNode[i]][disconNode[i+1]] = 1
		topoMatrix[disconNode[i+1]][disconNode[i]] = 1

	oddCount = calOddNum(topoMatrix, sNum)

	return topoMatrix, oddCount

def calOddNum(topoMatrix, sNum):
	count = 0
	for i in range(sNum):
		degreeSum = 0
		for j in range(sNum):
			degreeSum += topoMatrix[i][j]
		if degreeSum%2 == 1:
			count += 1
	return count

def createDepotSet(depotNum, sNum):
	depotSet = [0 for i in range(sNum)]
	for i in range(depotNum):
		randomDepot = random.randint(0,sNum-1)
		while depotSet[randomDepot] == 1:
			randomDepot = random.randint(0,sNum-1)
		depotSet[randomDepot] = 1
	return depotSet

if __name__ == '__main__':
	for i in range(20, 151, 2):        #various sNum
		topo, oddCount = createRandomTopo(i)
		depotSet = createDepotSet(12, i)     #set depotNum
		if oddCount == 0:
			eulerPathCount = 1
		else:
			eulerPathCount = oddCount/2
		print(topo)
		print(depotSet)
		print(eulerPathCount)
