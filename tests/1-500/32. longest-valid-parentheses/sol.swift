class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var st = [-1]
        var ans = 0
        for (i, ch) in s.enumerated() {
            if ch == "(" {
                st.append(i)
            } else {
                st.removeLast()
                if st.isEmpty {
                    st.append(i)
                } else {
                    ans = max(ans, i - st.last!)
                }
            }
        }
        return ans
    }
}
