class Solution {
    fun addToArrayForm(num: IntArray, k: Int): List<Int> {
        val result = mutableListOf<Int>()
        var i = num.size - 1
        var carry = k
        while (i >= 0 || carry > 0) {
            if (i >= 0) {
                carry += num[i--]
            }
            result.add(carry % 10)
            carry /= 10
        }
        if (result.isEmpty()) {
            result.add(0)
        }
        return result.reversed()
    }
}
