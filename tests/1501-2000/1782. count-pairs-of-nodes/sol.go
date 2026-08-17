func countPairs(n int, edges [][]int, queries []int) []int {
    x := make(map[int]map[int]bool)
    edge := make([]int, n)
    edgePair := make(map[[2]int]int)

    for _, e := range edges {
        i, j := e[0]-1, e[1]-1
        if x[i] == nil {
            x[i] = make(map[int]bool)
        }
        if x[j] == nil {
            x[j] = make(map[int]bool)
        }
        x[i][j] = true
        x[j][i] = true
        edge[i]++
        edge[j]++
        edgePair[[2]int{i, j}]++
        edgePair[[2]int{j, i}]++
    }
    
    res := make([]int, n)
    copy(res, edge)
    sort.Ints(res)
    
    binse := func(threshold int) int {
        i, j := 0, n-1
        ans := n
        for i <= j {
            mid := (i + j) / 2
            if res[mid] > threshold {
                ans = mid
                j = mid - 1
            } else {
                i = mid + 1
            }
        }
        return n - ans
    }
    
    result := make([]int, len(queries))
    for qi, query := range queries {
        v := make(map[int]bool)
        ans := 0
        
        var f func(int)
        f = func(i int) {
            v[i] = true
            a := binse(query - edge[i])
            
            if edge[i] > query - edge[i] {
                a--
            }
            
            for j := range x[i] {
                if edge[j] > query - edge[i] && edge[j] - edgePair[[2]int{i, j}] <= query - edge[i] {
                    a--
                }
                if !v[j] {
                    f(j)
                }
            }
            ans += a
        }
        
        for j := 0; j < n; j++ {
            if !v[j] {
                f(j)
            }
        }
        result[qi] = ans / 2
    }
    
    return result
}
