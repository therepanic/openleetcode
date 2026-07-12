class Solution {
    func binaryGap(_ n: Int) -> Int {
        var maxDist = 0
        var currDist = 0
        var foundFirstOne = false
        var num = n
        
        while num > 0 {
            let bit = num % 2
            
            if bit == 1 {
                if foundFirstOne {
                    maxDist = max(maxDist, currDist)
                }
                
                currDist = 1
                foundFirstOne = true
            } else {
                if foundFirstOne {
                    currDist += 1
                }
            }
            
            num /= 2
        }
        
        return maxDist
    }
}
