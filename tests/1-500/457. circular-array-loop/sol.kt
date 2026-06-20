class Solution {
    fun circularArrayLoop(nums: IntArray): Boolean {
        val n = nums.size
        fun nextIndex(i: Int): Int = ((i + nums[i]) % n + n) % n

        for (i in 0 until n) {
            var slow = i
            var fast = nextIndex(i)
            while (nums[slow] * nums[fast] > 0 && nums[slow] * nums[nextIndex(fast)] > 0) {
                if (slow == fast) {
                    if (slow == nextIndex(slow)) break
                    return true
                }
                slow = nextIndex(slow)
                fast = nextIndex(nextIndex(fast))
            }
            var j = i
            while (nums[j] * nums[nextIndex(j)] > 0) {
                val temp = j
                j = nextIndex(j)
                nums[temp] = 0
            }
        }
        return false
    }
}
