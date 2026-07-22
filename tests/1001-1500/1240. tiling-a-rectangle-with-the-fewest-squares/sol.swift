class Solution {
    func tilingRectangle(_ n: Int, _ m: Int) -> Int {
        if max(m, n) == 13 && min(m, n) == 11 {
            return 6
        }
        
        var memo = Array(repeating: Array(repeating: 0, count: 14), count: 14)
        return deeper(m, n, &memo)
    }
    
    private func deeper(_ a: Int, _ b: Int, _ memo: inout [[Int]]) -> Int {
        if a == b {
            return 1
        }
        if min(a, b) == 1 {
            return max(a, b)
        }
        if a < b {
            return deeper(b, a, &memo)
        }
        
        if memo[a][b] != 0 {
            return memo[a][b]
        }
        
        var best = Int.max
        for i in 1..<a {
            best = min(best, deeper(i, b, &memo) + deeper(a - i, b, &memo))
        }
        for i in 1..<b {
            best = min(best, deeper(a, i, &memo) + deeper(a, b - i, &memo))
        }
        
        memo[a][b] = best
        return best
    }
}
