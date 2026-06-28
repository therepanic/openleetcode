class Solution {
public:
    string shortestCompletingWord(string licensePlate, vector<string>& words) {
        int lp[26] = {0};
        for (char c : licensePlate) {
            if (isalpha(c)) {
                lp[tolower(c) - 'a']++;
            }
        }
        string ans;
        for (string& w : words) {
            int cw[26] = {0};
            for (char c : w) {
                cw[c - 'a']++;
            }
            bool ok = true;
            for (int i = 0; i < 26; i++) {
                if (cw[i] < lp[i]) {
                    ok = false;
                    break;
                }
            }
            if (ok && (ans.empty() || w.size() < ans.size())) {
                ans = w;
            }
        }
        return ans;
    }
};
