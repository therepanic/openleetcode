class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        unordered_map<char, int> last_seen;
        int start = 0;
        int res = 0;
        for (int end = 0; end < (int)s.size(); ++end) {
            char c = s[end];
            auto it = last_seen.find(c);
            if (it != last_seen.end() && it->second >= start) {
                start = it->second + 1;
            }
            res = max(res, end - start + 1);
            last_seen[c] = end;
        }
        return res;
    }
};
