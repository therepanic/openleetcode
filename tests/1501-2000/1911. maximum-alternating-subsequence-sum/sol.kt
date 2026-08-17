class Solution {

    fun maxAlternatingSum(nums: IntArray): Long {

        val n = nums.size

        var even = 0L
        var odd = 0L
        for (value in nums) {
            val nextEven = maxOf(even, odd + value)
            val nextOdd = maxOf(odd, even - value)
            even = nextEven
            odd = nextOdd
        }
        return even

    }

}
