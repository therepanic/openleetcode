class Solution {
    private lateinit var expr: String
    private val loc = HashMap<Int, Int>()
    
    fun minOperationsToFlip(expression: String): Int {
        expr = expression
        val stack = ArrayDeque<Int>()
        for (i in expression.length - 1 downTo 0) {
            when (expression[i]) {
                ')' -> stack.add(i)
                '(' -> loc[stack.removeLast()] = i
            }
        }
        return fn(0, expression.length - 1).second
    }
    
    private fun fn(lo: Int, hi: Int): Pair<Int, Int> {
        if (lo == hi) return expr[lo] - '0' to 1
        if (expr[hi] == ')' && loc[hi] == lo) return fn(lo + 1, hi - 1)
        val mid = (loc[hi] ?: hi) - 1
        val (v, c) = fn(mid + 1, hi)
        val (vv, cc) = fn(lo, mid - 1)
        val valv: Int
        val chg: Int
        if (expr[mid] == '|') {
            valv = v or vv
            if (v == 0 && vv == 0) chg = minOf(c, cc)
            else if (v == 1 && vv == 1) chg = 1 + minOf(c, cc)
            else chg = 1
        } else {
            valv = v and vv
            if (v == 0 && vv == 0) chg = 1 + minOf(c, cc)
            else if (v == 1 && vv == 1) chg = minOf(c, cc)
            else chg = 1
        }
        return valv to chg
    }
}
