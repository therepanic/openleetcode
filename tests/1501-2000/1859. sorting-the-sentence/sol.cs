public class Solution {
    public string SortSentence(string s) {
        var words = new Dictionary<int, string>();
        foreach (var word in s.Split(' ')) {
            int key = word[word.Length - 1] - '0';
            words[key] = word.Substring(0, word.Length - 1);
        }
        var result = "";
        for (int i = 1; i <= 9; i++) {
            if (!words.ContainsKey(i)) continue;
            if (result.Length > 0) result += " ";
            result += words[i];
        }
        return result;
    }
}
