class Solution {
    public int numSub(String s) {
        int cnt = 0;
        int total = 0;
        int mod = 1000000007;
        for (char a : s.toCharArray()) {
            if (a == '1') {
                cnt++;
            } else {
                cnt = 0;
            }
            total = (total + cnt) % mod;
        }
        return total;
    }
}
