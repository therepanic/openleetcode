public class Solution {
    public string ReplaceDigits(string s) {
        char[] chars = s.ToCharArray();
        for (int i = 1; i < chars.Length; i += 2) {
            char ch = chars[i - 1];
            int digit = chars[i] - '0';
            chars[i] = (char)(ch + digit);
        }
        return new string(chars);
    }
}
