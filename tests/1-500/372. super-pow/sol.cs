public class Solution {
    public int SuperPow(int a, int[] b) {
        a %= 1337;
        int result = 1;
        foreach (int d in b) {
            result = (PowMod(result, 10, 1337) * PowMod(a, d, 1337)) % 1337;
        }
        return result;
    }
    
    private int PowMod(int x, int n, int mod) {
        int res = 1;
        x %= mod;
        while (n > 0) {
            if ((n & 1) == 1) {
                res = (res * x) % mod;
            }
            x = (x * x) % mod;
            n >>= 1;
        }
        return res;
    }
}
