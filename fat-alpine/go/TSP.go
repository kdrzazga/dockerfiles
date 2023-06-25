package main

import (
	"fmt"
	"math"
)

// TSPSolver solves the Traveling Salesman Problem using brute force
func TSPSolver(graph [][]float64) (path []int, distance float64) {
	numCities := len(graph)
	minDistance := math.Inf(1)
	minPath := make([]int, numCities)

	perm := make([]int, numCities)
	for i := 0; i < numCities; i++ {
		perm[i] = i
	}

	for {
		var currentDistance float64
		for i := 0; i < numCities-1; i++ {
			currentDistance += graph[perm[i]][perm[i+1]]
		}
		currentDistance += graph[perm[numCities-1]][perm[0]]

		if currentDistance < minDistance {
			minDistance = currentDistance
			copy(minPath, perm)
		}

		if !nextPermutation(perm) {
			break
		}
	}

	return minPath, minDistance
}

// Helper function to generate the next permutation
func nextPermutation(perm []int) bool {
	var i, j int
	for i = len(perm) - 2; i >= 0 && perm[i] >= perm[i+1]; i-- {
	}

	if i < 0 {
		return false
	}

	for j = len(perm) - 1; perm[j] <= perm[i]; j-- {
	}

	perm[i], perm[j] = perm[j], perm[i]

	for k, l := i+1, len(perm)-1; k < l; k, l = k+1, l-1 {
		perm[k], perm[l] = perm[l], perm[k]
	}

	return true
}

func main() {
	// Example graph representation (distance matrix)
	graph := [][]float64{
		{0, 2, 9, math.Inf(1)},
		{1, 0, 6, 4},
		{math.Inf(1), 7, 0, 8},
		{6, 3, math.Inf(1), 0},
	}

	path, distance := TSPSolver(graph)
	fmt.Println("Shortest path:", path)
	fmt.Println("Shortest distance:", distance)
}

