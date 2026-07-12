class Solution {
    fun subarraysWithKDistinct(nums: IntArray, k: Int): Int {
        fun atMost(k: Int): Int {
            val freq = mutableMapOf<Int, Int>()
            var count = 0
            var left = 0
            val n = nums.size

            for (right in 0 until n) {
                freq[nums[right]] = freq.getOrDefault(nums[right], 0) + 1

                while (freq.size > k) {
                    if (freq[nums[left]]!! > 1) {
                        freq[nums[left]] = freq[nums[left]]!! - 1
                    } else {
                        freq.remove(nums[left])
                    }
                    left++
                }

                count += (right - left + 1)
            }

            return count
        }

        return atMost(k) - atMost(k - 1)
    }
}
