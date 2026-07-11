class Solution {
    fun minKBitFlips(nums: IntArray, k: Int): Int {
        val n = nums.size
        var ans = 0
        var flips = 0
        val flipped = IntArray(n + 1)

        for (i in 0..n - k) {
            flips += flipped[i]
            if ((nums[i] == 0 && flips % 2 == 0) || (nums[i] == 1 && flips % 2 != 0)) {
                flips++
                ans++
                flipped[i + k]--
            }
        }

        for (i in n - k + 1 until n) {
            flips += flipped[i]
            if ((nums[i] == 0 && flips % 2 == 0) || (nums[i] == 1 && flips % 2 != 0)) {
                return -1
            }
        }

        return ans
    }
}
