class Solution {
    fun removeDuplicates(s: String, k: Int): String {
        val stack = mutableListOf<Pair<Char, Int>>()
        for (char in s) {
            if (stack.isNotEmpty() && stack.last().first == char) {
                stack[stack.lastIndex] = stack.last().copy(second = stack.last().second + 1)
            } else {
                stack.add(Pair(char, 1))
            }
            if (stack.last().second == k) {
                stack.removeAt(stack.lastIndex)
            }
        }
        val sb = StringBuilder()
        for ((char, count) in stack) {
            repeat(count) { sb.append(char) }
        }
        return sb.toString()
    }
}
