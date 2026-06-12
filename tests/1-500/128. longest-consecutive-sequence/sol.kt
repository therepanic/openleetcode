class Solution {
    fun longestConsecutive(nums: IntArray): Int {
        if (nums.isEmpty()) {
            return 0
        }

        nums.sort()
        var best = 1
        var current = 1
        var i = 1
        while (i < nums.size) {
            if (nums[i] == nums[i - 1]) {
                i++
                continue
            }
            if (nums[i] == nums[i - 1] + 1) {
                current++
            } else {
                current = 1
            }
            if (current > best) {
                best = current
            }
            i++
        }
        return best
    }
}
