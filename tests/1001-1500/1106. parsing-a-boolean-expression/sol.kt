class Solution {
    fun parseBoolExpr(expression: String): Boolean {
        val st = mutableListOf<MutableList<Any>>(mutableListOf())
        for (ch in expression) {
            when (ch) {
                '&' -> st.add(mutableListOf("&"))
                '|' -> st.add(mutableListOf("|"))
                '!' -> st.add(mutableListOf("!"))
                't' -> st.last().add(true)
                'f' -> st.last().add(false)
                ')' -> {
                    val popped = st.removeAt(st.lastIndex)
                    val op = popped.removeAt(0) as String
                    val top = st.last()
                    when (op) {
                        "&" -> top.add(popped.all { it as Boolean })
                        "|" -> top.add(popped.any { it as Boolean })
                        "!" -> top.add(!(popped[0] as Boolean))
                    }
                }
            }
        }
        return st[0][0] as Boolean
    }
}
