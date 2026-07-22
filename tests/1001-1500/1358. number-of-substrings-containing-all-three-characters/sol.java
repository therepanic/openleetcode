class Solution {
    public int numberOfSubstrings(String s) {
        int res = 0;
        int[] p = {50000, -1, -1, -1};
        for (int i = 0; i < s.length(); i++) {
            p[s.charAt(i) & 31] = i;
            res += Math.min(Math.min(p[1], p[2]), p[3]) + 1;
        }
        return res;
    }
}
