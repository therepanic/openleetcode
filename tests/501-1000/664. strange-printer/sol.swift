class Solution {
    func strangePrinter(_ s: String) -> Int {
        let chars = Array(s)
        let n = chars.count
        var memo = Array(repeating: Array(repeating: -1, count: n), count: n)
        
        func minTurns(_ start: Int, _ end: Int) -> Int {
            if start > end {
                return 0
            }
            
            if memo[start][end] != -1 {
                return memo[start][end]
            }
            
            var res = minTurns(start, end - 1) + 1
            
            for middle in start..<end {
                if chars[middle] == chars[end] {
                    res = min(res, minTurns(start, middle) + minTurns(middle + 1, end - 1))
                }
            }
            
            memo[start][end] = res
            return res
        }
        
        return minTurns(0, n - 1)
    }
}
