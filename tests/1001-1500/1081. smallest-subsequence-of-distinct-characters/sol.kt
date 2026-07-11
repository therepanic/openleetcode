class Solution {
    fun smallestSubsequence(s: String): String {
        val fqMap = mutableMapOf<Char, Int>()
        val stack = mutableListOf<Char>()
        val visited = mutableSetOf<Char>()
        for (ch in s) {
            fqMap[ch] = fqMap.getOrDefault(ch, 0) + 1
        }
        for (ch in s) {
            fqMap[ch] = fqMap[ch]!! - 1
            if (visited.contains(ch)) {
                continue
            }
            while (stack.isNotEmpty() && ch < stack.last() && fqMap[stack.last()]!! > 0) {
                visited.remove(stack.removeAt(stack.size - 1))
            }
            visited.add(ch)
            stack.add(ch)
        }
        return stack.joinToString("")
    }
}
