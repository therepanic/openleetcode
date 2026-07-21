class Solution {
    func stoneGameII(_ piles: [Int]) -> Int {
        let n = piles.count
        var suffix = Array(repeating: 0, count: n + 1)
        for i in stride(from: n - 1, through: 0, by: -1) {
            suffix[i] = suffix[i + 1] + piles[i]
        }
        var memo = Array(repeating: Array(repeating: -1, count: n + 1), count: n)
        
        func best(_ i: Int, _ m: Int) -> Int {
            if i >= n { return 0 }
            if memo[i][m] != -1 { return memo[i][m] }
            var answer = 0
            for x in 1...min(2 * m, n - i) {
                answer = max(answer, suffix[i] - best(i + x, max(m, x)))
            }
            memo[i][m] = answer
            return answer
        }
        
        return best(0, 1)
    }
}
