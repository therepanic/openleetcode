class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        var zeroes = 0
        var ones = 0
        
        for ch in s {
            if ch == "0" {
                zeroes += 1
            }
        }
        
        var output = zeroes
        
        for ch in s {
            if ch == "0" {
                zeroes -= 1
            } else if ch == "1" {
                ones += 1
            }
            output = min(output, zeroes + ones)
        }
        
        return output
    }
}
