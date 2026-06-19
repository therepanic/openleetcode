public class Solution {
    public bool RepeatedSubstringPattern(string s) {
        string doubled = (s + s).Substring(1, 2 * s.Length - 2);
        return doubled.Contains(s);
    }
}
