class Solution {
    fun largestPerimeter(nums: IntArray): Int {
        val minVal = nums.minOrNull()!!
        val maxVal = nums.maxOrNull()!!

        val freq = IntArray(maxVal - minVal + 1)
        for (x in nums) {
            freq[x - minVal]++
        }

        var idx = 0
        for (v in maxVal downTo minVal) {
            while (freq[v - minVal] > 0) {
                nums[idx] = v
                idx++
                freq[v - minVal]--
            }
        }

        for (i in 0 until nums.size - 2) {
            if (nums[i + 1] + nums[i + 2] > nums[i]) {
                return nums[i] + nums[i + 1] + nums[i + 2]
            }
        }
        return 0
    }
}
