class Solution {
public:
    int countPalindromicSubsequence(string s) {
        int n = s.length();
        vector<int> first(26, -1);
        vector<int> last(26, -1);

        for (int i = 0; i < n; i++) {
            int c = s[i] - 'a';
            if (first[c] == -1) first[c] = i;
            last[c] = i;
        }

        int ans = 0;
        for (int c = 0; c < 26; c++) {
            if (first[c] != -1 && last[c] - first[c] > 1) {
                int mask = 0;
                for (int i = first[c] + 1; i < last[c]; i++) {
                    mask |= 1 << (s[i] - 'a');
                }
                ans += __builtin_popcount(mask);
            }
        }
        return ans;
    }
};
