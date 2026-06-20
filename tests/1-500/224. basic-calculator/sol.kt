class Solution {
    fun calculate(s: String): Int {
        val stack = ArrayDeque<Int>()
        var res = 0
        var curr = 0
        var sign = 1

        for (c in s) {
            when {
                c.isDigit() -> curr = curr * 10 + (c - '0')
                c == '+' -> {
                    res += sign * curr
                    sign = 1
                    curr = 0
                }
                c == '-' -> {
                    res += sign * curr
                    sign = -1
                    curr = 0
                }
                c == '(' -> {
                    stack.addLast(res)
                    stack.addLast(sign)
                    res = 0
                    sign = 1
                }
                c == ')' -> {
                    res += sign * curr
                    curr = 0
                    res *= stack.removeLast()
                    res += stack.removeLast()
                }
            }
        }

        res += sign * curr
        return res
    }
}
