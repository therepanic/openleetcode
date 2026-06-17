class Solution {
    fun removeDuplicateLetters(s: String): String {
        val lastOccur = mutableMapOf<Char, Int>()
        for (i in s.indices) {
            lastOccur[s[i]] = i
        }
        
        val stack = mutableListOf<Char>()
        val visited = mutableSetOf<Char>()
        
        for (i in s.indices) {
            if (s[i] in visited) {
                continue
            }
            
            while (stack.isNotEmpty() && s[i] < stack.last() && i < (lastOccur[stack.last()] ?: -1)) {
                visited.remove(stack.removeAt(stack.size - 1))
            }
            
            visited.add(s[i])
            stack.add(s[i])
        }
        
        return stack.joinToString("")
    }
}
