class Solution {
    func numWays(_ s: String) -> Int {
        let MOD = 1_000_000_007
        let totalOnes = s.filter { $0 == "1" }.count
        
        if totalOnes == 0 {
            let n = s.count
            return ((n - 1) * (n - 2) / 2) % MOD
        }
        
        if totalOnes % 3 != 0 {
            return 0
        }
        
        let onesPerPart = totalOnes / 3
        var firstSplitWays = 0
        var secondSplitWays = 0
        var count = 0
        
        for ch in s {
            if ch == "1" {
                count += 1
            }
            if count == onesPerPart {
                firstSplitWays += 1
            } else if count == 2 * onesPerPart {
                secondSplitWays += 1
            }
        }
        
        return (firstSplitWays * secondSplitWays) % MOD
    }
}
