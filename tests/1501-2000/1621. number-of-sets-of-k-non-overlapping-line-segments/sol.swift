class Solution {
    func numberOfSets(_ n: Int, _ k: Int) -> Int {
        let MOD = 1_000_000_007
        var dpPrev = [Int](repeating: 1, count: n)
        
        var prefixPrev = [Int](repeating: 0, count: n)
        prefixPrev[0] = dpPrev[0]
        for i in 1..<n {
            prefixPrev[i] = (prefixPrev[i-1] + dpPrev[i]) % MOD
        }
        
        for _ in 0..<k {
            var dpCur = [Int](repeating: 0, count: n)
            for i in 1..<n {
                dpCur[i] = (dpCur[i-1] + prefixPrev[i-1]) % MOD
            }
            dpPrev = dpCur
            prefixPrev[0] = dpPrev[0]
            for i in 1..<n {
                prefixPrev[i] = (prefixPrev[i-1] + dpPrev[i]) % MOD
            }
        }
        
        return dpPrev[n-1]
    }
}
