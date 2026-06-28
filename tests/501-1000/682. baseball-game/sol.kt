class Solution {
    fun calPoints(operations: Array<String>): Int {
        val stack = mutableListOf<Int>()
        for (op in operations) {
            when (op) {
                "C" -> stack.removeAt(stack.lastIndex)
                "D" -> stack.add(stack.last() * 2)
                "+" -> stack.add(stack.last() + stack[stack.lastIndex - 1])
                else -> stack.add(op.toInt())
            }
        }
        return stack.sum()
    }
}
