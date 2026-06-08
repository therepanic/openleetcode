class Solution {
    fun generateParenthesis(n: Int): List<String> {
        val res = mutableListOf<String>()
        val cur = StringBuilder()
        backtrack(0, 0, n, cur, res)
        return res
    }

    private fun backtrack(
        open: Int,
        close: Int,
        n: Int,
        cur: StringBuilder,
        res: MutableList<String>
    ) {
        if (open == n && close == n) {
            res.add(cur.toString())
            return
        }
        if (open < n) {
            cur.append('(')
            backtrack(open + 1, close, n, cur, res)
            cur.deleteCharAt(cur.length - 1)
        }
        if (close < open) {
            cur.append(')')
            backtrack(open, close + 1, n, cur, res)
            cur.deleteCharAt(cur.length - 1)
        }
    }
}
