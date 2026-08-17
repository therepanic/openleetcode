public class Solution {
    public int LongestAwesome(string s) {
        int n = s.Length;
        var mask = new Dictionary<int, int>();
        int curMask = 0;
        mask[curMask] = -1;
        int ans = 1;
        for (int i = 0; i < n; i++) {
            int num = s[i] - '0';
            curMask ^= (1 << num);
            int needMask = curMask;
            if (mask.ContainsKey(needMask)) {
                ans = Math.Max(ans, i - mask[needMask]);
            }
            for (int bit = 0; bit < 10; bit++) {
                int nNeedMax = needMask ^ (1 << bit);
                if (mask.ContainsKey(nNeedMax)) {
                    ans = Math.Max(ans, i - mask[nNeedMax]);
                }
            }
            if (!mask.ContainsKey(curMask)) {
                mask[curMask] = i;
            }
        }
        return ans;
    }
}
