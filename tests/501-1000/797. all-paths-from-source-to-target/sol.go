func allPathsSourceTarget(graph [][]int) [][]int {
    target := len(graph) - 1
    result := [][]int{}
    
    type pair struct {
        node int
        path []int
    }
    
    queue := []pair{{0, []int{0}}}
    
    for len(queue) > 0 {
        current := queue[0]
        queue = queue[1:]
        
        if current.node == target {
            result = append(result, current.path)
            continue
        }
        
        for _, neighbor := range graph[current.node] {
            newPath := make([]int, len(current.path)+1)
            copy(newPath, current.path)
            newPath[len(newPath)-1] = neighbor
            queue = append(queue, pair{neighbor, newPath})
        }
    }
    
    return result
}
