class Solution {
    fun numIdenticalPairs(nums: IntArray): Int {
        val pairs = mutableMapOf<Int, Int>()
        var count = 0
        for (num in nums) {
            if (pairs.containsKey(num)) {
                count += pairs[num]!!
            }
            pairs[num] = pairs.getOrDefault(num, 0) + 1
        }
        return count
    }
}
