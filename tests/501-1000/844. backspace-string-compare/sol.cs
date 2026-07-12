public class Solution {
    public bool BackspaceCompare(string s, string t) {
        int GetNextValidCharIndex(string str, int end) {
            int backspaceCount = 0;
            while (end >= 0) {
                if (str[end] == '#') {
                    backspaceCount++;
                } else if (backspaceCount > 0) {
                    backspaceCount--;
                } else {
                    break;
                }
                end--;
            }
            return end;
        }

        int ps = s.Length - 1;
        int pt = t.Length - 1;

        while (ps >= 0 || pt >= 0) {
            ps = GetNextValidCharIndex(s, ps);
            pt = GetNextValidCharIndex(t, pt);

            if (ps < 0 && pt < 0) {
                return true;
            }
            if (ps < 0 || pt < 0) {
                return false;
            } else if (s[ps] != t[pt]) {
                return false;
            }

            ps--;
            pt--;
        }

        return true;
    }
}
