class Solution {
    func findFarmland(_ land: [[Int]]) -> [[Int]] {
        let n = land.count
        let m = land[0].count
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        let directions = [[-1,0],[0,1],[1,0],[0,-1]]
        
        var maxr = [0]
        var maxc = [0]
        
        func dfs(_ r: Int, _ c: Int) {
            visited[r][c] = true
            maxr[0] = max(maxr[0], r)
            maxc[0] = max(maxc[0], c)
            for d in directions {
                let nr = r + d[0]
                let nc = c + d[1]
                if nr >= 0 && nr < n && nc >= 0 && nc < m {
                    if !visited[nr][nc] && land[nr][nc] == 1 {
                        dfs(nr, nc)
                    }
                }
            }
        }
        
        var res: [[Int]] = []
        for i in 0..<n {
            for j in 0..<m {
                if land[i][j] == 1 && !visited[i][j] {
                    maxr[0] = i
                    maxc[0] = j
                    dfs(i, j)
                    res.append([i, j, maxr[0], maxc[0]])
                }
            }
        }
        return res
    }
}
