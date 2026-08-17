class Solution {
    fun evaluate(s: String, knowledge: List<List<String>>): String {
        val mp = knowledge.associate { it[0] to it[1] }
        val ans = StringBuilder()
        var i = 0
        val n = s.length
        while (i < n) {
            if (s[i] == '(') {
                i++
                val temp = StringBuilder()
                while (i < n && s[i] != ')') {
                    temp.append(s[i])
                    i++
                }
                ans.append(mp[temp.toString()] ?: "?")
                i++
            } else {
                ans.append(s[i])
                i++
            }
        }
        return ans.toString()
    }
}
