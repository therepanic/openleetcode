public class Solution {
    public string TruncateSentence(string s, int k) {
        string[] words = s.Split(' ');
        return string.Join(" ", words.Take(k));
    }
}
