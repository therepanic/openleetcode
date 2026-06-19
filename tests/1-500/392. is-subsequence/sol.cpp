class Solution {
public:
    bool isSubsequence(string s, string t) {
        int sp = 0, tp = 0;
        while (sp < s.size() && tp < t.size()) {
            if (s[sp] == t[tp]) {
                sp++;
            }
            tp++;
        }
        return sp == s.size();
    }
};
