class Solution {
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var remainders = Array(repeating: 0, count: 60)
        for t in time {
            remainders[t % 60] += 1
        }
        
        var count = 0
        count += remainders[0] * (remainders[0] - 1) / 2
        count += remainders[30] * (remainders[30] - 1) / 2
        
        for i in 1..<30 {
            count += remainders[i] * remainders[60 - i]
        }
        
        return count
    }
}
