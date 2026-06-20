class Solution {
    func integerBreak(_ n: Int) -> Int {
        if n == 2 {
            return 1
        }
        if n == 3 {
            return 2
        }
        
        var threes = n / 3
        var remainder = n % 3
        
        if remainder == 1 {
            threes -= 1
            remainder = 4
        } else if remainder == 0 {
            remainder = 1
        }
        
        var result = 1
        for _ in 0..<threes {
            result *= 3
        }
        return result * remainder
    }
}
