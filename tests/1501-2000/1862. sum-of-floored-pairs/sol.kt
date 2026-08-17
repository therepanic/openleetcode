class Solution {
    fun sumOfFlooredPairs(nums: IntArray): Int {
        val MOD = 1_000_000_007
        val maxi = 100_001
        val maxVal = nums.max()!!
        val size = 2 * maxi + 1
        val freq = IntArray(size)
        for (num in nums) freq[num]++
        for (i in 1 until size) freq[i] += freq[i-1]
        
        var total = 0L
        for (num in 1..maxVal) {
            val countNum = freq[num] - freq[num-1]
            if (countNum == 0) continue
            var floorValue = 1
            while (floorValue.toLong() * num <= maxVal) {
                val left = floorValue * num
                val right = minOf((floorValue + 1) * num - 1, maxVal)
                val countInRange = freq[right] - freq[left - 1]
                total = (total + countNum.toLong() * floorValue * countInRange) % MOD
                floorValue++
            }
        }
        return total.toInt()
    }
}
