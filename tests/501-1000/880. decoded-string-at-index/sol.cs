public class Solution {
    public string DecodeAtIndex(string s, int k) {
        long size = 0;
        foreach (char ch in s) {
            if (char.IsDigit(ch)) {
                size *= ch - '0';
            } else {
                size++;
            }
        }

        long kk = k;
        for (int i = s.Length - 1; i >= 0; i--) {
            char ch = s[i];
            kk %= size;
            if (kk == 0 && char.IsLetter(ch)) {
                return ch.ToString();
            }
            if (char.IsDigit(ch)) {
                size /= ch - '0';
            } else {
                size--;
            }
        }
        return "";
    }
}
