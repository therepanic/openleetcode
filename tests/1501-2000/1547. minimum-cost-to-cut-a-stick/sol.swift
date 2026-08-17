class Solution {
    func minCost(_ n: Int, _ cuts: [Int]) -> Int {
        var c = cuts + [0, n]
        c.sort()
        let m = c.count
        var memo = Array(repeating: Array(repeating: -1, count: m), count: m)
        return optimize(0, m-1, c, &memo)
    }
    
    func optimize(_ i: Int, _ j: Int, _ c: [Int], _ memo: inout [[Int]]) -> Int {
        if j - i <= 1 { return 0 }
        if memo[i][j] != -1 { return memo[i][j] }
        var res = Int.max
        for k in (i+1)..<j {
            let val = optimize(i, k, c, &memo) + optimize(k, j, c, &memo)
            res = min(res, val)
        }
        memo[i][j] = res + (c[j] - c[i])
        return memo[i][j]
    }
}
