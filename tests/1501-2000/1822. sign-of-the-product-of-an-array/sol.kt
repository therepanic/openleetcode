class Solution {
    fun arraySign(nums: IntArray): Int {
        if (nums.contains(0)) return 0
        var negatives = 0
        for (num in nums) if (num < 0) negatives++
        return if (negatives % 2 == 0) 1 else -1
    }
}
