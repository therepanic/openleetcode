class Solution {
public:
    bool canPartitionKSubsets(vector<int>& nums, int k) {
        int total = accumulate(nums.begin(), nums.end(), 0);
        if (total % k != 0) return false;
        int target = total / k;
        sort(nums.begin(), nums.end(), greater<int>());
        if (nums[0] > target) return false;
        int n = nums.size();
        unordered_map<int, bool> memo;
        
        function<bool(int, int)> dfs = [&](int used, int curr) -> bool {
            if (used == (1 << n) - 1) return true;
            int key = (used << 10) | curr;
            if (memo.count(key)) return memo[key];
            for (int i = 0; i < n; i++) {
                if (!((used >> i) & 1) && curr + nums[i] <= target) {
                    int newCurr = curr + nums[i];
                    int nxt = (newCurr == target) ? 0 : newCurr;
                    if (dfs(used | (1 << i), nxt)) {
                        memo[key] = true;
                        return true;
                    }
                }
            }
            memo[key] = false;
            return false;
        };
        
        return dfs(0, 0);
    }
};
