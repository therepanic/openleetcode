class Solution {
    fun calculate(s: String): Int {
        val stack = mutableListOf<Int>()
        var n = 0
        var op = '+'
        val str = s + "+"
        
        for (c in str) {
            if (c == ' ') continue
            
            if (c.isDigit()) {
                n = n * 10 + (c - '0')
                continue
            }
            
            when (op) {
                '+' -> stack.add(n)
                '-' -> stack.add(-n)
                '*' -> stack.add(stack.removeAt(stack.lastIndex) * n)
                '/' -> stack.add(stack.removeAt(stack.lastIndex) / n)
            }
            
            op = c
            n = 0
        }
        
        return stack.sum()
    }
}
