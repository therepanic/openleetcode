class Solution {
    fun minOperations(nums: IntArray): Int {
        var sumBits = 0
        var maxNum = 0
        for (num in nums) {
            sumBits += Integer.bitCount(num)
            if (num > maxNum) {
                maxNum = num
            }
        }
        val doubling = if (maxNum > 0) Integer.toBinaryString(maxNum).length - 1 else 0
        return sumBits + doubling
    }
}
