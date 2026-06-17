func findMinHeightTrees(n int, edges [][]int) []int {
    if n < 3 {
        result := make([]int, n)
        for i := 0; i < n; i++ {
            result[i] = i
        }
        return result
    }

    adjacencyList := make([]map[int]bool, n)
    for i := 0; i < n; i++ {
        adjacencyList[i] = make(map[int]bool)
    }
    for _, edge := range edges {
        a, b := edge[0], edge[1]
        adjacencyList[a][b] = true
        adjacencyList[b][a] = true
    }

    leaves := []int{}
    for i := 0; i < n; i++ {
        if len(adjacencyList[i]) == 1 {
            leaves = append(leaves, i)
        }
    }

    remainingNodes := n
    for remainingNodes > 2 {
        remainingNodes -= len(leaves)
        newLeaves := []int{}
        for _, leaf := range leaves {
            var neighbor int
            for k := range adjacencyList[leaf] {
                neighbor = k
                break
            }
            delete(adjacencyList[neighbor], leaf)
            if len(adjacencyList[neighbor]) == 1 {
                newLeaves = append(newLeaves, neighbor)
            }
        }
        leaves = newLeaves
    }

    return leaves
}
