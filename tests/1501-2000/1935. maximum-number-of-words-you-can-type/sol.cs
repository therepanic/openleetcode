public class Solution {
    public int CanBeTypedWords(string text, string brokenLetters) {
        bool[] b = new bool[26];
        int res = 0;

        foreach (char c in brokenLetters) {
            b[c - 'a'] = true;
        }

        foreach (string w in text.Split(' ')) {
            bool ok = true;
            foreach (char c in w) {
                if (b[c - 'a']) {
                    ok = false;
                    break;
                }
            }
            if (ok) {
                res++;
            }
        }

        return res;
    }
}
