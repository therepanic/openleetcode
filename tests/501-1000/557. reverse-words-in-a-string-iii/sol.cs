public class Solution {
    public string ReverseWords(string s) {
        string[] words = s.Split(' ', StringSplitOptions.RemoveEmptyEntries);
        for (int i = 0; i < words.Length; i++) {
            char[] charArray = words[i].ToCharArray();
            Array.Reverse(charArray);
            words[i] = new string(charArray);
        }
        return string.Join(" ", words);
    }
}
