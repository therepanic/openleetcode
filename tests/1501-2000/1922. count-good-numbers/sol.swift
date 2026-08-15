class Solution {
    func countGoodNumbers(_ n: Int) -> Int {
        let mod = 1_000_000_007
        let evenPositions = (n + 1) / 2
        let oddPositions = n / 2
        
        let evenWays = chakraPower(5, evenPositions, mod)
        let oddWays = chakraPower(4, oddPositions, mod)
        
        return (evenWays * oddWays) % mod
    }
    
    func chakraPower(_ base: Int, _ power: Int, _ mod: Int) -> Int {
        var result = 1
        var b = base % mod
        var p = power
        while p > 0 {
            if p % 2 == 1 {
                result = (result * b) % mod
            }
            b = (b * b) % mod
            p /= 2
        }
        return result
    }
}
