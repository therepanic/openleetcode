class Solution {
    fun maxAbsoluteSum(nums: IntArray): Int {
        var prefixSum = 0
        var minPrefixSum = 0
        var maxPrefixSum = 0
        var maxAbsoluteSum = 0

        for (num in nums) {
            prefixSum += num
            
            maxAbsoluteSum = maxOf(maxAbsoluteSum, abs(prefixSum - minPrefixSum))
            maxAbsoluteSum = maxOf(maxAbsoluteSum, abs(prefixSum - maxPrefixSum))
            
            minPrefixSum = minOf(minPrefixSum, prefixSum)
            maxPrefixSum = maxOf(maxPrefixSum, prefixSum)
        }

        return maxAbsoluteSum
    }
}
