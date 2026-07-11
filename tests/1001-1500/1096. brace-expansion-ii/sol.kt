class Solution {
    fun braceExpansionII(expression: String): List<String> {
        val stack = ArrayDeque<MutableList<String>>()
        var res = mutableListOf<String>()
        var cur = mutableListOf<String>()
        for (v in expression) {
            when {
                v.isLetter() -> {
                    cur = if (cur.isEmpty()) {
                        mutableListOf(v.toString())
                    } else {
                        cur.map { it + v }.toMutableList()
                    }
                }
                v == '{' -> {
                    stack.addLast(res)
                    stack.addLast(cur)
                    res = mutableListOf()
                    cur = mutableListOf()
                }
                v == '}' -> {
                    val pre = stack.removeLast()
                    val preRes = stack.removeLast()
                    val merged = res + cur
                    cur = if (pre.isEmpty()) {
                        merged.toMutableList()
                    } else {
                        pre.flatMap { p -> merged.map { p + it } }.toMutableList()
                    }
                    res = preRes
                }
                v == ',' -> {
                    res.addAll(cur)
                    cur = mutableListOf()
                }
            }
        }
        return (res + cur).toSet().sorted()
    }
}
