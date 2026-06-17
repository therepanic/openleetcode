class Solution {
    fun singleNumber(nums: IntArray): IntArray {
        var x = 0
        for (n in nums) {
            x = x xor n
        }

        val bit = x and -x
        var a = 0
        var b = 0
        for (n in nums) {
            if ((n and bit) != 0) {
                a = a xor n
            } else {
                b = b xor n
            }
        }

        return intArrayOf(a, b)
    }
}
