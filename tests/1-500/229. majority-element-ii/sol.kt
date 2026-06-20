class Solution {
    fun majorityElement(nums: IntArray): List<Int> {
        var majority1 = 0
        var majority2 = 0
        var count1 = 0
        var count2 = 0

        for (num in nums) {
            when {
                num == majority1 -> count1++
                num == majority2 -> count2++
                count1 == 0 -> {
                    majority1 = num
                    count1 = 1
                }
                count2 == 0 -> {
                    majority2 = num
                    count2 = 1
                }
                else -> {
                    count1--
                    count2--
                }
            }
        }

        count1 = 0
        count2 = 0

        for (num in nums) {
            when (num) {
                majority1 -> count1++
                majority2 -> count2++
            }
        }

        val res = mutableListOf<Int>()
        if (count1 > nums.size / 3) res.add(majority1)
        if (count2 > nums.size / 3) res.add(majority2)

        return res
    }
}
