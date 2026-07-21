class Solution {
public:
    string sortString(string s) {
        if (s.empty()) return "";
        int counts[26] = {0};
        for (char c : s) {
            counts[c - 'a']++;
        }
        string ans;
        bool added;
        do {
            added = false;
            for (int i = 0; i < 26; i++) {
                if (counts[i] > 0) {
                    ans += (char)('a' + i);
                    counts[i]--;
                    added = true;
                }
            }
            for (int i = 25; i >= 0; i--) {
                if (counts[i] > 0) {
                    ans += (char)('a' + i);
                    counts[i]--;
                    added = true;
                }
            }
        } while (added);
        return ans;
    }
};
