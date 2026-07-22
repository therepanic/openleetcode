public class Solution {
    public int NumSub(string s) {
        int cnt = 0;
        int total = 0;
        int mod = 1000000007;
        foreach (char a in s) {
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
