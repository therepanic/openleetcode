class Solution {
    fun removeDuplicates(s: String): String {
        val stack = StringBuilder()
        for (c in s) {
            if (stack.isNotEmpty() && stack.last() == c) {
                stack.deleteCharAt(stack.length - 1)
            } else {
                stack.append(c)
            }
        }
        return stack.toString()
    }
}
