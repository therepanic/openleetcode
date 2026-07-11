class Solution {
    func largestIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        let r = grid.count
        let c = grid[0].count
        let dirs = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        var island = 2
        var a = [Int: Int]()
        
        func dfs(_ i: Int, _ j: Int, _ x: Int) -> Int {
            var tot = 1
            grid[i][j] = x
            for (dx, dy) in dirs {
                let nx = i + dx
                let ny = j + dy
                if nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] == 1 {
                    tot += dfs(nx, ny, x)
                }
            }
            return tot
        }
        
        for i in 0..<r {
            for j in 0..<c {
                if grid[i][j] == 1 {
                    a[island] = dfs(i, j, island)
                    island += 1
                }
            }
        }
        
        var res = 0
        for i in 0..<r {
            for j in 0..<c {
                if grid[i][j] == 0 {
                    var y = Set<Int>()
                    for (dx, dy) in dirs {
                        let nx = i + dx
                        let ny = j + dy
                        if nx >= 0 && nx < r && ny >= 0 && ny < c && grid[nx][ny] != 0 {
                            y.insert(grid[nx][ny])
                        }
                    }
                    var tot = 1
                    for b in y {
                        tot += a[b] ?? 0
                    }
                    res = max(res, tot)
                }
            }
        }
        
        return max(res, a[2] ?? 0)
    }
}
