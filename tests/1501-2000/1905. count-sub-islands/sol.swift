class Solution {
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        let m = grid1.count, n = grid1[0].count
        var grid2 = grid2
        var valid = false
        
        func dfs(_ i: Int, _ j: Int) {
            if i < 0 || i >= m || j < 0 || j >= n { return }
            if grid2[i][j] == 0 { return }
            if grid1[i][j] == 0 { valid = false }
            grid2[i][j] = 0
            dfs(i+1, j)
            dfs(i-1, j)
            dfs(i, j+1)
            dfs(i, j-1)
        }
        
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid2[i][j] == 1 {
                    valid = true
                    dfs(i, j)
                    if valid { res += 1 }
                }
            }
        }
        return res
    }
}
