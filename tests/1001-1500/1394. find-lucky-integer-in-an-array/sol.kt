class Solution {
    fun findLucky(arr: IntArray): Int {
        val freq = mutableMapOf<Int, Int>()
        for (num in arr) {
            freq[num] = freq.getOrDefault(num, 0) + 1
        }
        
        var lucky = -1
        for ((num, count) in freq) {
            if (num == count) {
                lucky = maxOf(lucky, num)
            }
        }
        
        return lucky
    }
}
