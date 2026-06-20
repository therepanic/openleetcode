class Solution {
    fun evalRPN(tokens: Array<String>): Int {
        val stack = IntArray(tokens.size)
        var size = 0
        for (token in tokens) {
            when (token) {
                "+", "-", "*", "/" -> {
                    val b = stack[--size]
                    val a = stack[--size]
                    val value = when (token) {
                        "+" -> a + b
                        "-" -> a - b
                        "*" -> a * b
                        else -> a / b
                    }
                    stack[size++] = value
                }
                else -> stack[size++] = parseInt(token)
            }
        }
        return stack[size - 1]
    }

    private fun parseInt(token: String): Int {
        var index = 0
        var sign = 1
        if (token[0] == '-') {
            sign = -1
            index = 1
        }
        var value = 0
        while (index < token.length) {
            value = value * 10 + (token[index] - '0')
            index++
        }
        return sign * value
    }
}
