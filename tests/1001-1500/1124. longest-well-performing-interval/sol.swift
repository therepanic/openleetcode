class Solution {
    func longestWPI(_ hours: [Int]) -> Int {
        var score = 0
        var longestInterval = 0
        var seenAt = [0: -1]
        
        for i in 0..<hours.count {
            score += hours[i] > 8 ? 1 : -1
            
            if score > 0 {
                longestInterval = i + 1
            } else if let prevIndex = seenAt[score - 1] {
                longestInterval = max(longestInterval, i - prevIndex)
            }
            
            if seenAt[score] == nil {
                seenAt[score] = i
            }
        }
        
        return longestInterval
    }
}
