class Solution {
    func removeBoxes(_ boxes: [Int]) -> Int {
        var groups: [(Int, Int)] = []
        var i = 0
        while i < boxes.count {
            let color = boxes[i]
            var count = 0
            while i < boxes.count && boxes[i] == color {
                count += 1
                i += 1
            }
            groups.append((color, count))
        }
        
        let n = groups.count
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: boxes.count + 1), count: n), count: n)
        
        func dfs(_ l: Int, _ r: Int, _ k: Int) -> Int {
            if l > r { return 0 }
            if dp[l][r][k] != 0 { return dp[l][r][k] }
            
            let color = groups[l].0
            let count = groups[l].1 + k
            var res = count * count + dfs(l + 1, r, 0)
            
            if l < r {
                for i in (l + 1)...r {
                    if groups[i].0 == color {
                        let left = dfs(l + 1, i - 1, 0)
                        let right = dfs(i, r, count)
                        res = max(res, left + right)
                    }
                }
            }
            
            dp[l][r][k] = res
            return res
        }
        
        return dfs(0, n - 1, 0)
    }
}
