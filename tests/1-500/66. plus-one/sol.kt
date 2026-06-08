class Solution {
    fun plusOne(digits: IntArray): IntArray {
        for (i in digits.indices.reversed()) {
            if (digits[i] < 9) {
                digits[i]++
                return digits
            }
            digits[i] = 0
        }

        val res = IntArray(digits.size + 1)
        res[0] = 1
        return res
    }
}
