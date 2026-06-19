using System.Text;

public class Solution {
    public string RemoveKdigits(string num, int k) {
        var s = new StringBuilder();
        foreach (char c in num) {
            while (k > 0 && s.Length > 0 && s[s.Length - 1] > c) {
                s.Length--;
                k--;
            }
            s.Append(c);
        }
        
        s.Length -= k;
        string result = s.ToString().TrimStart('0');
        return result == "" ? "0" : result;
    }
}
