func matrixRankTransform(matrix [][]int) [][]int {
    m, n := len(matrix), len(matrix[0])
    mp := make(map[int][][2]int)
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            mp[matrix[i][j]] = append(mp[matrix[i][j]], [2]int{i, j})
        }
    }
    
    rank := make([]int, m+n)
    ans := make([][]int, m)
    for i := range ans { ans[i] = make([]int, n) }
    
    keys := make([]int, 0, len(mp))
    for k := range mp { keys = append(keys, k) }
    sort.Ints(keys)
    
    for _, k := range keys {
        parent := make([]int, m+n)
        for i := range parent { parent[i] = i }
        var find func(int) int
        find = func(p int) int {
            if p != parent[p] {
                parent[p] = find(parent[p])
            }
            return parent[p]
        }
        
        for _, cell := range mp[k] {
            i, j := cell[0], cell[1]
            ii := find(i)
            jj := find(m+j)
            parent[ii] = jj
            if rank[ii] > rank[jj] { rank[jj] = rank[ii] }
        }
        
        seen := make(map[int]bool)
        for _, cell := range mp[k] {
            i, j := cell[0], cell[1]
            ii := find(i)
            if !seen[ii] {
                rank[ii]++
            }
            seen[ii] = true
            v := rank[ii]
            rank[i] = v
            rank[m+j] = v
            ans[i][j] = v
        }
    }
    return ans
}
