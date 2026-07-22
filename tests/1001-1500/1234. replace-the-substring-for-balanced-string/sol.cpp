class Solution {
public:
    int balancedString(string s) {
        int n = s.size();
        int each = n / 4;
        unordered_map<char, int> count;
        for (char c : s) {
            count[c]++;
        }
        unordered_map<char, int> extra;
        for (auto& [k, v] : count) {
            if (v > each) {
                extra[k] = v - each;
            }
        }
        if (extra.empty()) return 0;
        int left = 0;
        int res = INT_MAX;
        unordered_map<char, int> curr;
        for (int right = 0; right < n; right++) {
            char rc = s[right];
            if (extra.count(rc)) {
                curr[rc]++;
            }
            auto allMet = [&]() {
                for (auto& [k, v] : extra) {
                    if (curr[k] < v) return false;
                }
                return true;
            };
            while (allMet() && left <= right) {
                res = min(res, right - left + 1);
                char lc = s[left];
                if (curr.count(lc)) {
                    curr[lc]--;
                    if (curr[lc] == 0) {
                        curr.erase(lc);
                    }
                }
                left++;
            }
        }
        return res;
    }
};
