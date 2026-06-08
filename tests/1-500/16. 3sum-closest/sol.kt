class Solution {
    fun threeSumClosest(nums: IntArray, target: Int): Int {
        nums.sort()
        var best = nums[0] + nums[1] + nums[2]

        for (i in 0 until nums.size - 2) {
            var left = i + 1
            var right = nums.lastIndex
            while (left < right) {
                val sum = nums[i] + nums[left] + nums[right]
                if (kotlin.math.abs(target - sum) < kotlin.math.abs(target - best)) {
                    best = sum
                }
                if (sum == target) {
                    return target
                }
                if (sum < target) {
                    left++
                } else {
                    right--
                }
            }
        }

        return best
    }
}
