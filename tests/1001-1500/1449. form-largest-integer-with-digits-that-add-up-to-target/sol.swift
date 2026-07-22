class Solution {
    func largestNumber(_ cost: [Int], _ target: Int) -> String {
        let N = cost.count
        var memo = Array(repeating: Array(repeating: -1, count: target + 1), count: N + 1)
        
        func helper(_ i: Int, _ c: Int) -> Int {
            if c == 0 { return 0 }
            if i == N || c < 0 { return Int.min }
            if memo[i][c] != -1 { return memo[i][c] }
            var take = helper(i, c - cost[i])
            if take != Int.min { take += 1 }
            let notTake = helper(i + 1, c)
            memo[i][c] = max(take, notTake)
            return memo[i][c]
        }
        
        let e = helper(0, target)
        if e == Int.min { return "0" }
        
        var t = target
        var s = ""
        for k in 0..<e {
            for j in stride(from: 9, through: 1, by: -1) {
                if cost[j-1] <= t && helper(0, t - cost[j-1]) == e - k - 1 {
                    t -= cost[j-1]
                    s += String(j)
                    break
                }
            }
        }
        return s
    }
}
