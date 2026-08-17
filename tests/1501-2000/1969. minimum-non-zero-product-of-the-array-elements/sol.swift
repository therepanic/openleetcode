class Solution {
    func minNonZeroProduct(_ p: Int) -> Int {
        let mod = 1_000_000_007
        let maxNum = (1 << p) - 1
        let count = (1 << (p - 1)) - 1
        
        func powMod(_ x: Int, _ n: Int) -> Int {
            var base = x % mod
            var exp = n
            var result = 1
            while exp > 0 {
                if exp & 1 == 1 {
                    result = (result * base) % mod
                }
                base = (base * base) % mod
                exp >>= 1
            }
            return result
        }
        
        return (powMod(maxNum - 1, count) * (maxNum % mod)) % mod
    }
}
