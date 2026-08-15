public class Solution {
    public bool IsPrefixString(string s, string[] words) {
        string res = "";
        int i = 0;
        while (res.Length < s.Length) {
            if (i >= words.Length) return false;
            res += words[i];
            i++;
        }
        return res == s;
    }
}
