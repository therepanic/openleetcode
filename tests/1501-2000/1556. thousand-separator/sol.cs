public class Solution {
    public string ThousandSeparator(int n) {
        string s = n.ToString();
        if (s.Length <= 3) return s;
        var sb = new System.Text.StringBuilder();
        int count = 0;
        for (int i = s.Length - 1; i >= 0; i--) {
            sb.Append(s[i]);
            count++;
            if (count % 3 == 0 && i > 0) {
                sb.Append('.');
            }
        }
        char[] arr = sb.ToString().ToCharArray();
        Array.Reverse(arr);
        return new string(arr);
    }
}
