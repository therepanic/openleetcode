func hitBricks(grid [][]int, hits [][]int) []int {
    m, n := len(grid), len(grid[0])
    parent := make([]int, m*n+1)
    rank := make([]int, m*n+1)
    for i := range parent {
        parent[i] = i
        rank[i] = 1
    }
    
    var find func(int) int
    find = func(p int) int {
        if p != parent[p] {
            parent[p] = find(parent[p])
        }
        return parent[p]
    }
    
    union := func(p, q int) bool {
        rootP, rootQ := find(p), find(q)
        if rootP == rootQ {
            return false
        }
        if rank[rootP] > rank[rootQ] {
            rootP, rootQ = rootQ, rootP
        }
        parent[rootP] = rootQ
        rank[rootQ] += rank[rootP]
        return true
    }
    
    seen := make(map[int]bool)
    for _, hit := range hits {
        i, j := hit[0], hit[1]
        if grid[i][j] == 1 {
            seen[i*n+j] = true
            grid[i][j] = 0
        }
    }
    
    for j := 0; j < n; j++ {
        if grid[0][j] == 1 {
            union(j, m*n)
        }
    }
    
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            if grid[i][j] == 1 {
                if i > 0 && grid[i-1][j] == 1 {
                    union(i*n+j, (i-1)*n+j)
                }
                if j > 0 && grid[i][j-1] == 1 {
                    union(i*n+j, i*n+j-1)
                }
            }
        }
    }
    
    ans := make([]int, len(hits))
    prevStable := rank[find(m*n)]
    dirs := [][]int{{1,0}, {-1,0}, {0,1}, {0,-1}}
    
    for idx := len(hits) - 1; idx >= 0; idx-- {
        i, j := hits[idx][0], hits[idx][1]
        if seen[i*n+j] {
            grid[i][j] = 1
            if i == 0 {
                union(j, m*n)
            }
            for _, dir := range dirs {
                ii, jj := i+dir[0], j+dir[1]
                if ii >= 0 && ii < m && jj >= 0 && jj < n && grid[ii][jj] == 1 {
                    union(i*n+j, ii*n+jj)
                }
            }
            currStable := rank[find(m*n)]
            if currStable-prevStable-1 > 0 {
                ans[idx] = currStable - prevStable - 1
            } else {
                ans[idx] = 0
            }
            prevStable = currStable
        } else {
            ans[idx] = 0
        }
    }
    
    return ans
}
