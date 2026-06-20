class Solution {
    fun singleNumber(nums: IntArray): Int {
        var totalSum = 0L
        val seen = HashSet<Int>()
        for (num in nums) {
            totalSum += num.toLong()
            seen.add(num)
        }
        var uniqueSum = 0L
        for (num in seen) {
            uniqueSum += num.toLong()
        }
        val numerator = 3L * uniqueSum - totalSum
        return (numerator shr 1).toInt()
    }
}
