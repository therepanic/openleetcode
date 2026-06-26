class Solution {
    func checkRecord(_ s: String) -> Bool {
        var aCount = 0
        var lStreak = 0
        
        for c in s {
            if c == "A" {
                aCount += 1
                if aCount >= 2 {
                    return false
                }
            }
            if c == "L" {
                lStreak += 1
                if lStreak >= 3 {
                    return false
                }
            } else {
                lStreak = 0
            }
        }
        
        return true
    }
}
