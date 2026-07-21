public class Solution {
    private int i;

    public string ReverseParentheses(string s) {
        i = 0;
        return Helper(s);
    }

    private string Helper(string s) {
        var ans = new System.Text.StringBuilder();
        while (i < s.Length) {
            if (s[i] == '(') {
                i++;
                ans.Append(Helper(s));
            } else if (s[i] == ')') {
                i++;
                var charArray = ans.ToString().ToCharArray();
                System.Array.Reverse(charArray);
                return new string(charArray);
            } else {
                ans.Append(s[i]);
                i++;
            }
        }
        return ans.ToString();
    }
}
