func smallestMissingValueSubtree(parents []int, nums []int) []int {
    n := len(parents)
    graph := make([][]int, n)
    nodeOne := -1
    
    for child := 0; child < n; child++ {
        if parents[child] != -1 {
            graph[parents[child]] = append(graph[parents[child]], child)
        }
        if nums[child] == 1 {
            nodeOne = child
        }
    }
    
    results := make([]int, n)
    for i := range results {
        results[i] = 1
    }
    if nodeOne == -1 {
        return results
    }
    
    seen := make([]bool, 100002)
    current := nodeOne
    missing := 1
    
    for current != -1 {
        markSeen(current, graph, seen, nums)
        for missing < 100002 && seen[missing] {
            missing++
        }
        results[current] = missing
        current = parents[current]
    }
    
    return results
}

func markSeen(node int, graph [][]int, seen []bool, nums []int) {
    if !seen[nums[node]] {
        seen[nums[node]] = true
        for _, child := range graph[node] {
            markSeen(child, graph, seen, nums)
        }
    }
}
