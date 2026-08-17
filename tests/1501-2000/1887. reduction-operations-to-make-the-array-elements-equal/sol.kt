class Solution {
    fun reductionOperations(nums: IntArray): Int {
        val freq = IntArray(50001)
        for (num in nums) {
            freq[num]++
        }
        var idx = 1
        while (freq[idx] == 0) idx++
        var accumulated = 0
        var total = 0
        for (i in 50000 downTo idx+1) {
            if (freq[i] > 0) {
                accumulated += freq[i]
                total += accumulated
            }
        }
        return total
    }
}
