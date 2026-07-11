class Solution {
public:
    int lastStoneWeightII(vector<int>& stones) {
        int n = stones.size();
        int total = accumulate(stones.begin(), stones.end(), 0);
        int target = total / 2;
        vector<int> dp_prev(target + 1, 0);
        for (int i = n - 1; i >= 0; i--) {
            vector<int> dp_curr(target + 1, 0);
            for (int size = 0; size <= target; size++) {
                int skip = dp_prev[size];
                int take = (size >= stones[i]) ? dp_prev[size - stones[i]] + stones[i] : INT_MIN;
                dp_curr[size] = max(skip, take);
            }
            dp_prev = dp_curr;
        }
        return total - 2 * dp_prev[target];
    }
};
