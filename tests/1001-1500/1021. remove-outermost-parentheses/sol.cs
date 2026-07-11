public class Solution {
    public string RemoveOuterParentheses(string s) {
        var res = new System.Text.StringBuilder();
        int balance = 0;
        int start = 0;
        for (int i = 0; i < s.Length; i++) {
            if (s[i] == '(') {
                balance++;
            } else {
                balance--;
            }
            if (balance == 0) {
                res.Append(s, start + 1, i - start - 1);
                start = i + 1;
            }
        }
        return res.ToString();
    }
}
