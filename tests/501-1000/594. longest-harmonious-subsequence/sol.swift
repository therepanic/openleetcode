class Solution {
    func findLHS(_ nums: [Int]) -> Int {
        var frequencyMap = [Int: Int]()
        for num in nums {
            frequencyMap[num, default: 0] += 1
        }
        
        var maxLength = 0
        for (num, count) in frequencyMap {
            if let nextCount = frequencyMap[num + 1] {
                let currentLength = count + nextCount
                maxLength = max(maxLength, currentLength)
            }
        }
        
        return maxLength
    }
}
