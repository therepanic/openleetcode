func findSmallestSetOfVertices(n int, edges [][]int) []int {
    hasIncoming := make([]bool, n)
    for _, edge := range edges {
        hasIncoming[edge[1]] = true
    }
    var result []int
    for i := 0; i < n; i++ {
        if !hasIncoming[i] {
            result = append(result, i)
        }
    }
    return result
}
