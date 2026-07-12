public class Solution {
    public int ExpressiveWords(string s, string[] words) {
        (char[], int[]) Encode(string x) {
            var chars = new System.Collections.Generic.List<char>();
            var cnts = new System.Collections.Generic.List<int>();
            char prev = '\0';
            int c = 0;
            foreach (char ch in x) {
                if (ch == prev) {
                    c++;
                } else {
                    if (prev != '\0') {
                        chars.Add(prev);
                        cnts.Add(c);
                    }
                    prev = ch;
                    c = 1;
                }
            }
            if (prev != '\0') {
                chars.Add(prev);
                cnts.Add(c);
            }
            return (chars.ToArray(), cnts.ToArray());
        }
        
        var (sChars, sCnts) = Encode(s);
        int ans = 0;
        foreach (string w in words) {
            var (wChars, wCnts) = Encode(w);
            if (!sChars.SequenceEqual(wChars)) continue;
            bool ok = true;
            for (int i = 0; i < sCnts.Length; i++) {
                int sc = sCnts[i], wc = wCnts[i];
                if (sc < wc || (sc < 3 && sc != wc)) {
                    ok = false;
                    break;
                }
            }
            if (ok) ans++;
        }
        return ans;
    }
}
