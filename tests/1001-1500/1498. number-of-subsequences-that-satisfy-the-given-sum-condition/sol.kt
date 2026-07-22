class Solution {
    fun numSubseq(nums: IntArray, target: Int): Int {
        val mod = 1000000007
        nums.sort()
        val n = nums.size

        val power = IntArray(n)
        power[0] = 1
        for (i in 1 until n) {
            power[i] = (power[i - 1] * 2) % mod
        }

        var left = 0
        var right = n - 1
        var result = 0

        while (left <= right) {
            if (nums[left] + nums[right] <= target) {
                result = (result + power[right - left]) % mod
                left++
            } else {
                right--
            }
        }

        return result
    }
}
