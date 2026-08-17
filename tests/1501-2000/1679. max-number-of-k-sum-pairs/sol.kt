class Solution {
    fun maxOperations(nums: IntArray, k: Int): Int {
        nums.sort()
        var i = 0
        var j = nums.size - 1
        var count = 0

        while (i < j) {
            val total = nums[i] + nums[j]
            if (total == k) {
                count++
                i++
                j--
            } else if (total > k) {
                j--
            } else {
                i++
            }
        }

        return count
    }
}
