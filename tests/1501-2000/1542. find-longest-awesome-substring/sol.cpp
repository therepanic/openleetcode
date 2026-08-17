class Solution {
public:
    int longestAwesome(string s) {
        int n = s.size();
        unordered_map<int, int> mask;
        int curMask = 0;
        mask[curMask] = -1;
        int ans = 1;
        for (int i = 0; i < n; i++) {
            int num = s[i] - '0';
            curMask ^= (1 << num);
            int needMask = curMask;
            if (mask.count(needMask)) {
                ans = max(ans, i - mask[needMask]);
            }
            for (int bit = 0; bit < 10; bit++) {
                int nNeedMax = needMask ^ (1 << bit);
                if (mask.count(nNeedMax)) {
                    ans = max(ans, i - mask[nNeedMax]);
                }
            }
            if (!mask.count(curMask)) {
                mask[curMask] = i;
            }
        }
        return ans;
    }
};
