class Solution {
    private let MOD = 1000000007
    
    func countPalindromicSubsequences(_ s: String) -> Int {
        let n = s.count
        let chars = Array(s)
        var memo = Array(repeating: Array(repeating: -1, count: n + 1), count: n + 1)
        
        func dp(_ left: Int, _ right: Int) -> Int {
            if left >= right { return 0 }
            if memo[left][right] != -1 { return memo[left][right] }
            var res = 0
            for ch in "abcd" {
                var l = -1
                for i in left..<right {
                    if chars[i] == ch {
                        l = i
                        break
                    }
                }
                if l == -1 { continue }
                var r = -1
                for i in stride(from: right - 1, through: left, by: -1) {
                    if chars[i] == ch {
                        r = i
                        break
                    }
                }
                if r == -1 { continue }
                if l == r {
                    res += 1
                } else {
                    res += dp(l + 1, r) + 2
                }
            }
            res %= MOD
            memo[left][right] = res
            return res
        }
        
        return dp(0, n)
    }
}
