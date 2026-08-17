class Solution {
    fun minOperations(nums: IntArray): Int {
        val length = nums.size
        var minOps = length
        val uniqueNums = nums.distinct().sorted()
        var right = 0
        
        for (left in uniqueNums.indices) {
            while (right < uniqueNums.size && uniqueNums[right] < uniqueNums[left] + length) {
                right++
            }
            
            minOps = minOf(minOps, length - (right - left))
        }
        
        return minOps
    }
}
