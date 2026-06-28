class Solution {
    fun letterCasePermutation(s: String): List<String> {
        val ans = mutableListOf<String>()
        fun solve(idx: Int, curr: StringBuilder) {
            if (idx == s.length) {
                ans.add(curr.toString())
                return
            }
            if (s[idx].isDigit()) {
                curr.append(s[idx])
                solve(idx + 1, curr)
                curr.deleteCharAt(curr.length - 1)
                return
            }
            curr.append(s[idx].lowercaseChar())
            solve(idx + 1, curr)
            curr.deleteCharAt(curr.length - 1)
            
            curr.append(s[idx].uppercaseChar())
            solve(idx + 1, curr)
            curr.deleteCharAt(curr.length - 1)
        }
        solve(0, StringBuilder())
        return ans
    }
}
