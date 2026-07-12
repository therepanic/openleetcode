class Solution {
    func shortestSuperstring(_ words: [String]) -> String {
        let n = words.count
        var overlap = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        func getOverlap(_ a: String, _ b: String) -> Int {
            var maxOlap = 0
            let aChars = Array(a)
            let bChars = Array(b)
            for k in 1...min(a.count, b.count) {
                if aChars.suffix(k) == bChars.prefix(k) {
                    maxOlap = max(maxOlap, k)
                }
            }
            return maxOlap
        }
        
        for i in 0..<n {
            for j in 0..<n {
                if i != j {
                    overlap[i][j] = getOverlap(words[i], words[j])
                }
            }
        }
        
        var dp = Array(repeating: Array(repeating: "", count: n), count: 1 << n)
        for i in 0..<n {
            dp[1 << i][i] = words[i]
        }
        
        for mask in 0..<(1 << n) {
            for u in 0..<n {
                if (mask & (1 << u)) == 0 { continue }
                for v in 0..<n {
                    if (mask & (1 << v)) != 0 { continue }
                    let newMask = mask | (1 << v)
                    let candidate = dp[mask][u] + String(words[v].dropFirst(overlap[u][v]))
                    if dp[newMask][v].isEmpty || candidate.count < dp[newMask][v].count {
                        dp[newMask][v] = candidate
                    }
                }
            }
        }
        
        var shortest = ""
        for candidate in dp[(1 << n) - 1] {
            if shortest.isEmpty || candidate.count < shortest.count {
                shortest = candidate
            }
        }
        return shortest
    }
}
