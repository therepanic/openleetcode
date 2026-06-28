class Solution {
    func movesToChessboard(_ board: [[Int]]) -> Int {
        let n = board.count
        
        func fn(_ vals: [Int]) -> Int {
            var total = 0
            var odd = 0
            for i in 0..<vals.count {
                if vals[0] == vals[i] {
                    total += 1
                    if i & 1 == 1 {
                        odd += 1
                    }
                } else if vals[0] ^ vals[i] != (1 << n) - 1 {
                    return Int.max / 2
                }
            }
            var ans = Int.max / 2
            if n <= 2 * total && 2 * total <= n + 1 {
                ans = min(ans, odd)
            }
            if n - 1 <= 2 * total && 2 * total <= n {
                ans = min(ans, total - odd)
            }
            return ans
        }
        
        var rows = [Int](repeating: 0, count: n)
        var cols = [Int](repeating: 0, count: n)
        for i in 0..<n {
            for j in 0..<n {
                if board[i][j] == 1 {
                    rows[i] ^= 1 << j
                    cols[j] ^= 1 << i
                }
            }
        }
        let ans = fn(rows) + fn(cols)
        return ans >= Int.max / 2 ? -1 : ans
    }
}
