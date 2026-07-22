func countSubTrees(n int, edges [][]int, labels string) []int {
    matrix := make([][]int, n)
    for i := 0; i < n; i++ {
        matrix[i] = []int{}
    }
    for _, edge := range edges {
        u, v := edge[0], edge[1]
        matrix[u] = append(matrix[u], v)
        matrix[v] = append(matrix[v], u)
    }

    parent := make([]int, n)
    for i := range parent {
        parent[i] = -1
    }
    order := []int{0}
    for i := 0; i < len(order); i++ {
        node := order[i]
        for _, child := range matrix[node] {
            if child != parent[node] {
                parent[child] = node
                order = append(order, child)
            }
        }
    }

    counts := make([][26]int, n)
    ans := make([]int, n)
    for i := len(order) - 1; i >= 0; i-- {
        node := order[i]
        label := labels[node] - 'a'
        counts[node][label]++
        ans[node] = counts[node][label]
        if parent[node] != -1 {
            for j := 0; j < 26; j++ {
                counts[parent[node]][j] += counts[node][j]
            }
        }
    }
    return ans
}
