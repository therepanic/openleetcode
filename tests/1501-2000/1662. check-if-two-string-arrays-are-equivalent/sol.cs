public class Solution {
    public bool ArrayStringsAreEqual(string[] word1, string[] word2) {
        string s1 = string.Concat(word1);
        string s2 = string.Concat(word2);
        return s1 == s2;
    }
}
