class Solution {
public:
    int minSideJumps(vector<int>& obstacles) {
        const int INF = INT_MAX / 2;
        vector<int> dp = {1, 0, 1};
        for (int i = 1; i < obstacles.size(); i++) {
            int obs = obstacles[i];
            for (int j = 0; j < 3; j++) {
                if (obs == j + 1) dp[j] = INF;
            }
            for (int j = 0; j < 3; j++) {
                if (obs != j + 1) {
                    dp[j] = min(dp[j], min(dp[(j + 1) % 3], dp[(j + 2) % 3]) + 1);
                }
            }
        }
        return min({dp[0], dp[1], dp[2]});
    }
};
