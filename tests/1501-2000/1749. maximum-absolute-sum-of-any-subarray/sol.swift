class Solution {
    func maxAbsoluteSum(_ nums: [Int]) -> Int {
        var prefixSum = 0
        var minPrefixSum = 0
        var maxPrefixSum = 0
        var maxAbsoluteSum = 0

        for num in nums {
            prefixSum += num
            
            maxAbsoluteSum = max(maxAbsoluteSum, abs(prefixSum - minPrefixSum))
            maxAbsoluteSum = max(maxAbsoluteSum, abs(prefixSum - maxPrefixSum))
            
            minPrefixSum = min(minPrefixSum, prefixSum)
            maxPrefixSum = max(maxPrefixSum, prefixSum)
        }

        return maxAbsoluteSum
    }
}
