class Solution {
    fun makeGood(s: String): String {
        val stack = StringBuilder()
        for (ch in s) {
            if (stack.isNotEmpty() && kotlin.math.abs(ch.code - stack.last().code) == 32) {
                stack.deleteCharAt(stack.length - 1)
            } else {
                stack.append(ch)
            }
        }
        return stack.toString()
    }
}
