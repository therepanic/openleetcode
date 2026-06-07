using System;
using System.Collections.Generic;

public class Solution {
    public int LongestValidParentheses(string s) {
        var st = new Stack<int>();
        st.Push(-1);
        int ans = 0;
        for (int i = 0; i < s.Length; i++) {
            if (s[i] == '(') st.Push(i);
            else {
                st.Pop();
                if (st.Count == 0) st.Push(i);
                else ans = Math.Max(ans, i - st.Peek());
            }
        }
        return ans;
    }
}
