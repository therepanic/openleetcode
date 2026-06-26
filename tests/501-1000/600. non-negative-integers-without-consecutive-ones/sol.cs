public class Solution {
    public int FindIntegers(int n) {
        int[] f = new int[30];
        f[0] = 1;
        f[1] = 2;
        for (int i = 2; i < 30; i++) {
            f[i] = f[i - 1] + f[i - 2];
        }
        
        int ans = 0;
        int last_seen = 0;
        for (int i = 29; i >= 0; i--) {
            if (((1 << i) & n) != 0) {
                ans += f[i];
                if (last_seen == 1) {
                    ans -= 1;
                    break;
                }
                last_seen = 1;
            } else {
                last_seen = 0;
            }
        }
        return ans + 1;
    }
}
