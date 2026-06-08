using System.Collections.Generic;

public class Solution {
    public bool IsValid(string s) {
        var st = new Stack<char>();
        foreach (var ch in s) {
            if (ch == '(' || ch == '[' || ch == '{') st.Push(ch);
            else {
                if (st.Count == 0) return false;
                var top = st.Pop();
                if (ch == ')' && top != '(') return false;
                if (ch == ']' && top != '[') return false;
                if (ch == '}' && top != '{') return false;
            }
        }
        return st.Count == 0;
    }
}
