class Solution {
    fun longestValidParentheses(s: String): Int {
        val st = ArrayDeque<Int>()
        st.push(-1)
        var ans = 0
        for (i in s.indices) {
            if (s[i] == '(') {
                st.push(i)
            } else {
                st.pop()
                if (st.isEmpty()) {
                    st.push(i)
                } else {
                    ans = max(ans, i - st.peek())
                }
            }
        }
        return ans
    }
}
