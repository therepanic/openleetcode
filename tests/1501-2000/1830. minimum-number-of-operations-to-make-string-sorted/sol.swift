class Solution {
    func makeStringSorted(_ s: String) -> Int {
        let MOD = 1_000_000_007
        let n = s.count
        let chars = Array(s)
        var fac = Array(repeating: 1, count: n + 1)
        var invFac = Array(repeating: 1, count: n + 1)
        
        for i in 1...n {
            fac[i] = (fac[i - 1] * i) % MOD
        }
        invFac[n] = modPow(fac[n], MOD - 2)
        for i in stride(from: n, through: 1, by: -1) {
            invFac[i - 1] = (invFac[i] * i) % MOD
        }
        
        var freq = Array(repeating: 0, count: 26)
        for ch in chars {
            freq[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
        }
        
        var ans = 0
        for i in 0..<n {
            var smallRight = 0
            for j in 0..<Int(chars[i].asciiValue! - Character("a").asciiValue!) {
                smallRight = (smallRight + freq[j]) % MOD
            }
            
            let rem = n - i - 1
            var temp = 1
            temp = (temp * fac[rem]) % MOD
            temp = (temp * smallRight) % MOD
            
            for x in freq {
                if x > 1 {
                    temp = (temp * invFac[x]) % MOD
                }
            }
            
            freq[Int(chars[i].asciiValue! - Character("a").asciiValue!)] -= 1
            ans = (ans + temp) % MOD
        }
        
        return ans
    }
    
    private func modPow(_ x: Int, _ n: Int) -> Int {
        let MOD = 1_000_000_007
        if x == 1 || n == 0 {
            return 1
        }
        if n == 1 {
            return x % MOD
        }
        if n % 2 == 1 {
            return (x * modPow((x * x) % MOD, n / 2)) % MOD
        }
        return modPow((x * x) % MOD, n / 2) % MOD
    }
}
