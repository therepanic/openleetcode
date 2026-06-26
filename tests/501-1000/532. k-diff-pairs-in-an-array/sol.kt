class Solution {
    fun findPairs(nums: IntArray, k: Int): Int {
        if (k < 0) return 0
        var count = 0
        val numCounts = mutableMapOf<Int, Int>()
        for (num in nums) {
            numCounts[num] = numCounts.getOrDefault(num, 0) + 1
        }
        for ((num, freq) in numCounts) {
            if (k == 0) {
                if (freq >= 2) count++
            } else {
                if (numCounts.containsKey(num + k)) count++
            }
        }
        return count
    }
}
