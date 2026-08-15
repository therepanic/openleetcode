class Solution {
    func numberOfGoodSubsets(_ nums: [Int]) -> Int {
        let mod = 1_000_000_007
        let primes = [2,3,5,7,11,13,17,19,23,29]
        var freq = Array(repeating: 0, count: 31)
        for x in nums { freq[x] += 1 }
        var masks = Array(repeating: 0, count: 31)
        for x in 2...30 {
            var y = x, mask = 0, ok = true
            for b in 0..<10 {
                let p = primes[b]
                if y % (p * p) == 0 { ok = false; break }
                if y % p == 0 { mask |= 1 << b }
            }
            if ok { masks[x] = mask }
        }
        var dp = Array(repeating: 0, count: 1024); dp[0] = 1
        for x in 2...30 {
            let mask = masks[x]
            if mask == 0 || freq[x] == 0 { continue }
            for state in stride(from: 1023, through: 0, by: -1) where state & mask == 0 {
                let next = state | mask
                dp[next] = (dp[next] + dp[state] * freq[x]) % mod
            }
        }
        var ans = dp.dropFirst().reduce(0) { ($0 + $1) % mod }
        for _ in 0..<freq[1] { ans = ans * 2 % mod }
        return ans
    }
}
