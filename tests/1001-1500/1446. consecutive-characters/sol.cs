public class Solution {
    public int MaxPower(string s) {
        int maxcnt = 0;
        int cnt = 0;
        for (int i = 1; i < s.Length; i++) {
            if (s[i] == s[i - 1]) {
                cnt++;
            } else {
                cnt = 0;
            }
            maxcnt = Math.Max(cnt, maxcnt);
        }
        return maxcnt + 1;
    }
}
