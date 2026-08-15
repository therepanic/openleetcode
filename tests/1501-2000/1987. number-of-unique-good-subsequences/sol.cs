public class Solution {
    public int NumberOfUniqueGoodSubsequences(string binary) {
        long a = 0, b = 0;
        int z = 0;
        const long MOD = 1000000007;
        foreach (char c in binary) {
            if (c == '1') {
                b = (a + b + 1) % MOD;
            } else {
                a = (a + b) % MOD;
                z = 1;
            }
        }
        return (int)((a + b + z) % MOD);
    }
}
