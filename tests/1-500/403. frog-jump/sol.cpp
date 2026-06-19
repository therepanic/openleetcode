class Solution {
public:
    bool canCross(vector<int>& stones) {
        unordered_map<int, unordered_set<int>> dp;
        for (int stone : stones) {
            dp[stone] = unordered_set<int>();
        }
        dp[0].insert(0);

        for (int stone : stones) {
            for (int jump : dp[stone]) {
                for (int jumpDistance : {jump - 1, jump, jump + 1}) {
                    if (jumpDistance > 0 && dp.find(stone + jumpDistance) != dp.end()) {
                        dp[stone + jumpDistance].insert(jumpDistance);
                    }
                }
            }
        }

        return !dp[stones.back()].empty();
    }
};
