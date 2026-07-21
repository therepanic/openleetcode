class Solution {
    public int maxPower(String s) {
        int maxcnt = 0;
        int cnt = 0;
        for (int i = 1; i < s.length(); i++) {
            if (s.charAt(i) == s.charAt(i - 1)) {
                cnt++;
            } else {
                cnt = 0;
            }
            maxcnt = Math.max(cnt, maxcnt);
        }
        return maxcnt + 1;
    }
}
