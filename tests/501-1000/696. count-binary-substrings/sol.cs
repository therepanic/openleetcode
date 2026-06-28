public class Solution {
    public int CountBinarySubstrings(string s) {
        int ans = 0, prev = 0, cur = 1;
        for (int i = 1; i < s.Length; i++) {
            if (s[i-1] != s[i]) {
                ans += Math.Min(prev, cur);
                prev = cur;
                cur = 1;
            } else {
                cur++;
            }
        }
        return ans + Math.Min(prev, cur);
    }
}
