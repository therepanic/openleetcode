public class Solution {
    public string ReversePrefix(string word, char ch) {
        int idx = word.IndexOf(ch);
        if (idx == -1) {
            return word;
        }
        char[] chars = word.ToCharArray();
        Array.Reverse(chars, 0, idx + 1);
        return new string(chars);
    }
}
