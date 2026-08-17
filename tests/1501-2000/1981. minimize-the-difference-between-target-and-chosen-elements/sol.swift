class Solution {
    func minimizeTheDifference(_ mat: [[Int]], _ target: Int) -> Int {
        var mat = mat
        for i in 0..<mat.count {
            mat[i].sort()
        }
        var dp: [String: Int] = [:]
        var mini = Int.max
        
        func dfs(_ i: Int, _ ans: Int) -> Int {
            if i < 0 {
                let diff = abs(ans)
                mini = min(mini, diff)
                return diff
            }
            let key = "\(i),\(ans)"
            if let val = dp[key] {
                return val
            }
            if ans < 0 && abs(ans) > mini {
                return Int.max / 2
            }
            var take = Int.max / 2
            for z in 0..<mat[i].count {
                if z > 0 && mat[i][z] == mat[i][z-1] {
                    continue
                }
                take = min(take, dfs(i-1, ans - mat[i][z]))
                if take == 0 {
                    break
                }
            }
            dp[key] = take
            return take
        }
        
        return dfs(mat.count - 1, target)
    }
}
