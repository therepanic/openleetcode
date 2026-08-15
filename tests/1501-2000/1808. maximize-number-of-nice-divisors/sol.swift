class Solution {
    func maxNiceDivisors(_ primeFactors: Int) -> Int {
        let MOD = 1_000_000_007
        if primeFactors == 1 { return 1 }
        let q = primeFactors / 3
        let r = primeFactors % 3
        func power(_ base: Int, _ exp: Int) -> Int {
            var result = 1
            var b = base
            var e = exp
            while e > 0 {
                if e % 2 == 1 {
                    result = result * b % MOD
                }
                b = b * b % MOD
                e /= 2
            }
            return result
        }
        switch r {
        case 0:
            return power(3, q)
        case 1:
            return power(3, q-1) * 4 % MOD
        default:
            return power(3, q) * 2 % MOD
        }
    }
}
