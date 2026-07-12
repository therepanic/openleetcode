class Solution {
    fun numSubarraysWithSum(nums: IntArray, goal: Int): Int {
        val n = nums.size
        val posOf1s = mutableListOf(-1)
        var total = 0
        var count = 0
        
        if (goal == 0) {
            for (num in nums) {
                if (num == 0) {
                    count++
                    total += count
                } else {
                    count = 0
                }
            }
            return total
        }
        
        nums.forEachIndexed { i, num ->
            if (num == 1) posOf1s.add(i)
        }
        posOf1s.add(n)
        
        for (i in 1 until posOf1s.size - goal) {
            val leftChoices = posOf1s[i] - posOf1s[i - 1]
            val rightChoices = posOf1s[i + goal] - posOf1s[i + goal - 1]
            total += leftChoices * rightChoices
        }
        
        return total
    }
}
