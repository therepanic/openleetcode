class Solution {
    fun minPatches(nums: IntArray, n: Int): Int {
        var currentSum = 1L
        var patches = 0
        var index = 0
        
        while (currentSum <= n) {
            if (index < nums.size && nums[index] <= currentSum) {
                currentSum += nums[index]
                index++
            } else {
                currentSum += currentSum
                patches++
            }
        }
        
        return patches
    }
}
