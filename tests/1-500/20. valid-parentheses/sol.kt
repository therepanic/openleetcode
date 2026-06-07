class Solution {
    fun isValid(s: String): Boolean {
        val stack = java.util.ArrayDeque<Char>()
        for (ch in s) {
            if (ch == '(' || ch == '[' || ch == '{') {
                stack.push(ch)
            } else {
                if (stack.isEmpty()) {
                    return false
                }
                val top = stack.pop()
                if (ch == ')' && top != '(') {
                    return false
                }
                if (ch == ']' && top != '[') {
                    return false
                }
                if (ch == '}' && top != '{') {
                    return false
                }
            }
        }
        return stack.isEmpty()
    }
}
