class Solution {
    fun findLHS(nums: IntArray): Int {
        val frequencyMap = mutableMapOf<Int, Int>()
        for (num in nums) {
            frequencyMap[num] = frequencyMap.getOrDefault(num, 0) + 1
        }
        
        var maxLength = 0
        for (num in frequencyMap.keys) {
            if (frequencyMap.containsKey(num + 1)) {
                val currentLength = frequencyMap[num]!! + frequencyMap[num + 1]!!
                maxLength = maxOf(maxLength, currentLength)
            }
        }
        
        return maxLength
    }
}
