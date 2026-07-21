public class Solution {
    public int IsPrefixOfWord(string sentence, string searchWord) {
        string[] words = sentence.Split(" ");
        for (int i = 0; i < words.Length; i++) {
            if (words[i].StartsWith(searchWord)) {
                return i + 1;
            }
        }
        return -1;
    }
}
