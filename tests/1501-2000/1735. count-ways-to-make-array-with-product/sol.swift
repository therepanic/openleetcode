class Solution {
    let mod = 1_000_000_007
    
    func waysToFillArray(_ queries: [[Int]]) -> [Int] {
        var result = [Int]()
        
        for q in queries {
            let n = q[0]
            let k = q[1]
            let factors = primeFactors(k)
            var total = 1
            for (_, cnt) in factors {
                total = total * comb(n + cnt - 1, n - 1) % mod
            }
            result.append(total)
        }
        return result
    }
    
    private func primeFactors(_ n: Int) -> [Int: Int] {
        var num = n
        var dict = [Int: Int]()
        var p = 2
        while p * p <= num {
            while num % p == 0 {
                dict[p, default: 0] += 1
                num /= p
            }
            p += 1
        }
        if num > 1 {
            dict[num, default: 0] += 1
        }
        return dict
    }
    
    private func comb(_ n: Int, _ r: Int) -> Int {
        var rr = r
        if rr > n - rr { rr = n - rr }
        var result = 1
        if rr == 0 { return 1 }
        for i in 1...rr { result = result * (n - i + 1) % mod * modPow(i, mod - 2) % mod }
        return result
    }

    private func modPow(_ base: Int, _ exponent: Int) -> Int { var a = base, e = exponent, r = 1; while e > 0 { if e & 1 == 1 { r = r * a % mod }; a = a * a % mod; e >>= 1 }; return r }
}
