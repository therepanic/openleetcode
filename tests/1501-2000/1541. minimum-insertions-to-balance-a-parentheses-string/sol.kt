class Solution {
    fun minInsertions(s: String): Int {
        val stack = java.util.ArrayDeque<Char>()
        var count = 0
        var i = 0
        
        while (i < s.length) {
            if (s[i] == '(') {
                stack.push('(')
            } else {
                if (stack.isEmpty()) {
                    if (i != s.length - 1 && s[i + 1] == ')') {
                        count += 1
                        i++
                    } else {
                        count += 2
                    }
                } else {
                    if (i != s.length - 1 && s[i + 1] == ')') {
                        stack.pop()
                        i++
                    } else {
                        count += 1
                        stack.pop()
                    }
                }
            }
            i++
        }
        
        return count + stack.size * 2
    }
}
