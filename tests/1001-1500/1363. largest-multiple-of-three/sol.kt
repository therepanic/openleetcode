class Solution {
    fun largestMultipleOfThree(digits: IntArray): String {
        val counts = IntArray(10)
        for (digit in digits) {
            counts[digit]++
        }

        var sum = 0
        for (i in 0..9) {
            sum += i * counts[i]
        }
        val remainder = sum % 3

        fun removeSmallest(group: IntArray, amount: Int): Boolean {
            var amt = amount
            for (digit in group) {
                while (amt > 0 && counts[digit] > 0) {
                    counts[digit]--
                    amt--
                }
            }
            return amt == 0
        }

        if (remainder == 1) {
            if (!removeSmallest(intArrayOf(1, 4, 7), 1)) {
                removeSmallest(intArrayOf(2, 5, 8), 2)
            }
        } else if (remainder == 2) {
            if (!removeSmallest(intArrayOf(2, 5, 8), 1)) {
                removeSmallest(intArrayOf(1, 4, 7), 2)
            }
        }

        val sb = StringBuilder()
        for (i in 9 downTo 0) {
            repeat(counts[i]) {
                sb.append(i)
            }
        }
        val result = sb.toString()
        return if (result.startsWith('0')) "0" else result
    }
}
