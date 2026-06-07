class Solution {
    fun letterCombinations(digits: String): List<String> {
        if (digits.isEmpty()) {
            return emptyList()
        }

        val map = arrayOf("", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz")
        val res = mutableListOf<String>()
        val cur = StringBuilder()
        backtrack(digits, 0, map, cur, res)
        return res
    }

    private fun backtrack(
        digits: String,
        idx: Int,
        map: Array<String>,
        cur: StringBuilder,
        res: MutableList<String>
    ) {
        if (idx == digits.length) {
            res.add(cur.toString())
            return
        }

        val letters = map[digits[idx] - '0']
        for (ch in letters) {
            cur.append(ch)
            backtrack(digits, idx + 1, map, cur, res)
            cur.deleteCharAt(cur.length - 1)
        }
    }
}
