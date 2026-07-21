public class Solution {
    public IList<string> PrintVertically(string s) {
        string[] words = s.Split(' ');
        int maxLen = 0;
        foreach (string word in words) {
            if (word.Length > maxLen) {
                maxLen = word.Length;
            }
        }
        IList<string> res = new List<string>();
        for (int i = 0; i < maxLen; i++) {
            string currWord = "";
            foreach (string word in words) {
                if (i < word.Length) {
                    currWord += word[i];
                } else {
                    currWord += " ";
                }
            }
            res.Add(currWord.TrimEnd(' '));
        }
        return res;
    }
}
