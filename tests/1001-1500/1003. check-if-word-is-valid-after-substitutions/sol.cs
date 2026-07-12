public class Solution {
    public bool IsValid(string s) {
        if (s == "abc") {
            return true;
        }
        if (s[0] != 'a' || s[s.Length - 1] != 'c') {
            return false;
        }
        List<char> l = new List<char>(s);
        for (int j = 0; j < l.Count; j++) {
            for (int i = 0; i <= l.Count - 3; i++) {
                if (l.Count == 3 && l[0] == 'a' && l[1] == 'b' && l[2] == 'c') {
                    return true;
                }
                if (i + 2 <= l.Count - 1) {
                    if (l[i] == 'a' && l[i+1] == 'b' && l[i+2] == 'c') {
                        l.RemoveAt(i);
                        l.RemoveAt(i);
                        l.RemoveAt(i);
                        i = -1;
                        continue;
                    }
                }
            }
        }
        if (l.Count == 0) {
            return true;
        }
        return false;
    }
}
