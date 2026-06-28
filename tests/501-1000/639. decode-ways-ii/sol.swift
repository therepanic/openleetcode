class Solution {
    func numDecodings(_ s: String) -> Int {
        let M = 1000000007
        let chars = Array(s)
        let n = chars.count - 1
        
        var d: [String: Int] = [:]
        for i in 1...26 { d[String(i)] = 1 }
        for i in 0...9 { d["*\(i)"] = 1 + (i < 7 ? 1 : 0) }
        d["*"] = 9
        d["**"] = 15
        d["1*"] = 9
        d["2*"] = 6
        
        var dp = [Int](repeating: 0, count: n + 2)
        dp[0] = d[String(chars[0])] ?? 0
        dp[n + 1] = 1
        
        for i in 0..<n {
            let one = String(chars[i + 1])
            let two = String(chars[i]) + String(chars[i + 1])
            
            var count = ((d[one] ?? 0) * dp[i]) % M
            count = (count + (d[two] ?? 0) * (i > 0 ? dp[i - 1] : 1)) % M
            dp[i + 1] = count
            
            if dp[i + 1] == 0 { return 0 }
        }
        
        return dp[n]
    }
}
