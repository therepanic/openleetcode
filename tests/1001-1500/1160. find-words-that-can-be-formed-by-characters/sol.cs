public class Solution {
    public int CountCharacters(string[] words, string chars) {
        Dictionary<char, int> ch = new Dictionary<char, int>();
        foreach (char c in chars) {
            if (ch.ContainsKey(c)) {
                ch[c]++;
            } else {
                ch[c] = 1;
            }
        }
        
        int res = 0;
        foreach (string word in words) {
            Dictionary<char, int> copy = new Dictionary<char, int>(ch);
            bool good = true;
            foreach (char c in word) {
                if (copy.ContainsKey(c) && copy[c] > 0) {
                    copy[c]--;
                } else {
                    res -= word.Length;
                    good = false;
                    break;
                }
            }
            res += word.Length;
        }
        return res;
    }
}
