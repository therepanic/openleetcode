class Solution {
    fun findNumbers(nums: IntArray): Int {
        var count = 0
        for (i in nums) {
            val msb = i.countLeadingZeroBits().let { 32 - it - 1 }
            var digits = (msb * 0.30103).toInt() + 1
            if (i >= Math.pow(10.0, digits.toDouble())) {
                digits++
            }
            if (digits % 2 == 0) {
                count++
            }
        }
        return count
    }
}
