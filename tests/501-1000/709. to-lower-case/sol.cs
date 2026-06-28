public class Solution {
    public string ToLowerCase(string s) {
        string result = "";
        foreach (char ch in s) {
            if (ch >= 65 && ch <= 90) {
                result += (char)(ch + 32);
            } else {
                result += ch;
            }
        }
        return result;
    }
}
