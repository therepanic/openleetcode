class Solution {
public:
    bool canConvertString(string s, string t, int k) {
        if (s.length() != t.length()) return false;
        int shift_count[26] = {0};
        for (int i = 0; i < s.length(); ++i) {
            if (s[i] == t[i]) continue;
            int diff = (t[i] - s[i] + 26) % 26;
            shift_count[diff]++;
            if (diff + 26 * (shift_count[diff] - 1) > k) return false;
        }
        return true;
    }
};
