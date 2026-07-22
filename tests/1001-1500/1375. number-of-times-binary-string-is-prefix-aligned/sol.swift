class Solution {
    func numTimesAllBlue(_ flips: [Int]) -> Int {
        var res = 0
        var maxFlips = 0
        
        for i in 0..<flips.count {
            maxFlips = max(maxFlips, flips[i])
            if maxFlips == i + 1 {
                res += 1
            }
        }
        
        return res
    }
}
