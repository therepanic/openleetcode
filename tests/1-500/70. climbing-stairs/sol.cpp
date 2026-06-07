class Solution {
public:
    int climbStairs(int n) {
        if (n <= 3) {
            return n;
        }
        int prev2 = 2;
        int prev1 = 3;
        for (int step = 4; step <= n; ++step) {
            int cur = prev1 + prev2;
            prev2 = prev1;
            prev1 = cur;
        }
        return prev1;
    }
};
