class Solution {
    func maxScoreSightseeingPair(_ values: [Int]) -> Int {
        let n = values.count
        var suffixMax = [Int](repeating: 0, count: n)
        suffixMax[n - 1] = values[n - 1] - (n - 1)
        
        for i in stride(from: n - 2, through: 0, by: -1) {
            suffixMax[i] = max(suffixMax[i + 1], values[i] - i)
        }
        
        var maxScore = Int.min
        for i in 0..<(n - 1) {
            maxScore = max(maxScore, values[i] + i + suffixMax[i + 1])
        }
        
        return maxScore
    }
}
