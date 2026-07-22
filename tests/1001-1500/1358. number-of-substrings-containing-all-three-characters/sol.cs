public class Solution {
    public int NumberOfSubstrings(string s) {
        int res = 0;
        int[] p = {50000, -1, -1, -1};
        for (int i = 0; i < s.Length; i++) {
            p[s[i] & 31] = i;
            res += Math.Min(Math.Min(p[1], p[2]), p[3]) + 1;
        }
        return res;
    }
}
