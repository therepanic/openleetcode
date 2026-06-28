public class Solution {
    public string FindLongestWord(string s, IList<string> dictionary) {
        string ans = "";
        foreach (string word in dictionary) {
            int i = 0, j = 0;
            while (i < word.Length && j < s.Length) {
                if (word[i] == s[j]) {
                    i++;
                }
                j++;
            }
            if (i == word.Length) {
                if (word.Length > ans.Length) {
                    ans = word;
                } else if (word.Length == ans.Length && string.Compare(word, ans) < 0) {
                    ans = word;
                }
            }
        }
        return ans;
    }
}
