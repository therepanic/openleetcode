class Solution {
    private func dist(_ size: Int, _ p: Int, _ t: Int) -> Int {
        let diff = abs(t - p)
        return min(diff, size - diff)
    }
    
    func findRotateSteps(_ ring: String, _ key: String) -> Int {
        var mp = Array(repeating: Array(repeating: 0, count: 100), count: 26)
        var freq = Array(repeating: 0, count: 26)
        var dp = Array(repeating: Array(repeating: 0, count: 100), count: 100)
        
        let n = ring.count
        let m = key.count
        let ringChars = Array(ring)
        let keyChars = Array(key)
        
        for i in 0..<n {
            let idx = Int(ringChars[i].asciiValue! - Character("a").asciiValue!)
            mp[idx][freq[idx]] = i
            freq[idx] += 1
        }
        
        let firstChar = Int(keyChars[0].asciiValue! - Character("a").asciiValue!)
        for i in 0..<freq[firstChar] {
            dp[0][mp[firstChar][i]] = dist(n, 0, mp[firstChar][i]) + 1
        }
        
        for i in 1..<m {
            let prevChar = Int(keyChars[i - 1].asciiValue! - Character("a").asciiValue!)
            let currChar = Int(keyChars[i].asciiValue! - Character("a").asciiValue!)
            for j in 0..<freq[currChar] {
                var mini = Int.max
                for k in 0..<freq[prevChar] {
                    mini = min(mini, dp[i - 1][mp[prevChar][k]] +
                              dist(n, mp[currChar][j], mp[prevChar][k]) + 1)
                }
                dp[i][mp[currChar][j]] = mini
            }
        }
        
        let lastChar = Int(keyChars[m - 1].asciiValue! - Character("a").asciiValue!)
        var res = Int.max
        for i in 0..<freq[lastChar] {
            res = min(res, dp[m - 1][mp[lastChar][i]])
        }
        
        return res
    }
}
