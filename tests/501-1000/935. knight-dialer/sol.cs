public class Solution {
    public int KnightDialer(int n) {
        if (n == 1) {
            return 10;
        }
        
        int[] dp = new int[10];
        for (int i = 0; i < 10; i++) {
            dp[i] = 1;
        }
        
        int[][] mapping = new int[][] {
            new int[] {4, 6},
            new int[] {6, 8},
            new int[] {7, 9},
            new int[] {4, 8},
            new int[] {0, 3, 9},
            new int[] {},
            new int[] {0, 1, 7},
            new int[] {2, 6},
            new int[] {1, 3},
            new int[] {2, 4}
        };
        
        const int MOD = 1000000007;
        
        for (int step = 0; step < n - 1; step++) {
            int[] newDp = new int[10];
            for (int i = 0; i < 10; i++) {
                foreach (int digit in mapping[i]) {
                    newDp[digit] = (newDp[digit] + dp[i]) % MOD;
                }
            }
            dp = newDp;
        }
        
        int sum = 0;
        foreach (int val in dp) {
            sum = (sum + val) % MOD;
        }
        return sum;
    }
}
