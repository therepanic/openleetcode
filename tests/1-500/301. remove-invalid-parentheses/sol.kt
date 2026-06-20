class Solution {
    fun removeInvalidParentheses(s: String): List<String> {
        fun isValid(str: String): Boolean {
            var ctr = 0
            for (ch in str) {
                when (ch) {
                    '(' -> ctr++
                    ')' -> {
                        if (ctr == 0) return false
                        ctr--
                    }
                }
            }
            return ctr == 0
        }
        
        var level = setOf(s)
        while (true) {
            val valid = level.filter { isValid(it) }
            if (valid.isNotEmpty()) return valid
            level = level.flatMap { str ->
                (0 until str.length).map { i ->
                    str.substring(0, i) + str.substring(i + 1)
                }
            }.toSet()
        }
    }
}
