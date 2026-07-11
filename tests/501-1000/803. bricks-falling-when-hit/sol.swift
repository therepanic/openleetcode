class Solution {
    func hitBricks(_ grid: [[Int]], _ hits: [[Int]]) -> [Int] {
        var grid = grid
        let m = grid.count
        let n = grid[0].count
        var parent = Array(0..<m*n+1)
        var rank = Array(repeating: 1, count: m*n+1)
        
        func find(_ p: Int) -> Int {
            if p != parent[p] {
                parent[p] = find(parent[p])
            }
            return parent[p]
        }
        
        func union(_ p: Int, _ q: Int) -> Bool {
            var rootP = find(p)
            var rootQ = find(q)
            if rootP == rootQ { return false }
            if rank[rootP] > rank[rootQ] {
                swap(&rootP, &rootQ)
            }
            parent[rootP] = rootQ
            rank[rootQ] += rank[rootP]
            return true
        }
        
        var seen = Set<Int>()
        for hit in hits {
            let i = hit[0], j = hit[1]
            if grid[i][j] == 1 {
                seen.insert(i * n + j)
                grid[i][j] = 0
            }
        }
        
        for j in 0..<n {
            if grid[0][j] == 1 {
                _ = union(j, m * n)
            }
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    if i > 0 && grid[i-1][j] == 1 {
                        _ = union(i * n + j, (i-1) * n + j)
                    }
                    if j > 0 && grid[i][j-1] == 1 {
                        _ = union(i * n + j, i * n + j - 1)
                    }
                }
            }
        }
        
        var ans = [Int]()
        var prevStable = rank[find(m * n)]
        let dirs = [(1,0), (-1,0), (0,1), (0,-1)]
        
        for hit in hits.reversed() {
            let i = hit[0], j = hit[1]
            if seen.contains(i * n + j) {
                grid[i][j] = 1
                if i == 0 {
                    _ = union(j, m * n)
                }
                for (di, dj) in dirs {
                    let ii = i + di, jj = j + dj
                    if ii >= 0 && ii < m && jj >= 0 && jj < n && grid[ii][jj] == 1 {
                        _ = union(i * n + j, ii * n + jj)
                    }
                }
                let currStable = rank[find(m * n)]
                ans.append(max(0, currStable - prevStable - 1))
                prevStable = currStable
            } else {
                ans.append(0)
            }
        }
        
        return ans.reversed()
    }
}
