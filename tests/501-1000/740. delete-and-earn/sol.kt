class Solution {
    fun deleteAndEarn(nums: IntArray): Int {
        val count = mutableMapOf<Int, Int>()
        for (num in nums) {
            count[num] = count.getOrDefault(num, 0) + 1
        }
        val uniqueNums = count.keys.sorted()
        var prev: Int? = null
        var take = 0
        var skip = 0

        for (num in uniqueNums) {
            val maxPoints = maxOf(skip, take)
            if (prev == num - 1) {
                take = num * count[num]!! + skip
                skip = maxPoints
            } else {
                take = num * count[num]!! + maxPoints
                skip = maxPoints
            }
            prev = num
        }

        return maxOf(take, skip)
    }
}
