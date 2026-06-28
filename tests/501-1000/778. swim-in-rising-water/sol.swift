class Solution {
    func swimInWater(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let dirs = [(0,-1),(0,1),(-1,0),(1,0)]
        
        func dfs(_ x: Int, _ y: Int, _ t: Int, _ vis: inout [[Bool]]) -> Bool {
            if x == n - 1 && y == n - 1 {
                return true
            }
            vis[x][y] = true
            for (dx, dy) in dirs {
                let nx = x + dx, ny = y + dy
                if nx >= 0 && nx < n && ny >= 0 && ny < n && !vis[nx][ny] && grid[nx][ny] <= t {
                    if dfs(nx, ny, t, &vis) {
                        return true
                    }
                }
            }
            return false
        }
        
        var low = 0, high = n * n - 1, ans = Int.max
        while low <= high {
            let mid = (low + high) / 2
            var vis = Array(repeating: Array(repeating: false, count: n), count: n)
            if grid[0][0] <= mid && dfs(0, 0, mid, &vis) {
                ans = mid
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return ans
    }
}
