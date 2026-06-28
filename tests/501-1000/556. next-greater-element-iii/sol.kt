class Solution {
    fun nextGreaterElement(n: Int): Int {
        val digits = n.toString().toCharArray()
        val length = digits.size
        var pivot = -1

        for (i in length - 2 downTo 0) {
            if (digits[i] < digits[i + 1]) {
                pivot = i
                break
            }
        }

        if (pivot == -1) {
            return -1
        }

        for (i in length - 1 downTo pivot + 1) {
            if (digits[i] > digits[pivot]) {
                val temp = digits[i]
                digits[i] = digits[pivot]
                digits[pivot] = temp
                break
            }
        }

        var left = pivot + 1
        var right = length - 1
        while (left < right) {
            val temp = digits[left]
            digits[left] = digits[right]
            digits[right] = temp
            left++
            right--
        }

        val result = String(digits).toLong()
        return if (result <= Int.MAX_VALUE) result.toInt() else -1
    }
}
