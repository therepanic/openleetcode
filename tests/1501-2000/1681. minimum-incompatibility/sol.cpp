class Solution {
public:
    int minimumIncompatibility(vector<int>& nums, int k) {
        int n = nums.size();
        int sz = n / k;
        
        unordered_map<int, int> counts;
        for (int num : nums) {
            counts[num]++;
        }
        for (auto& [num, v] : counts) {
            if (v > k) return -1;
        }
        
        sort(nums.begin(), nums.end());
        
        unordered_map<int, int> valid_subsets;
        for (int mask = 0; mask < (1 << n); mask++) {
            if (__builtin_popcount(mask) == sz) {
                vector<int> subset;
                for (int i = 0; i < n; i++) {
                    if ((mask >> i) & 1) {
                        subset.push_back(nums[i]);
                    }
                }
                unordered_set<int> set(subset.begin(), subset.end());
                if (set.size() == sz) {
                    int max_val = *max_element(subset.begin(), subset.end());
                    int min_val = *min_element(subset.begin(), subset.end());
                    valid_subsets[mask] = max_val - min_val;
                }
            }
        }
        
        unordered_map<int, int> memo;
        function<int(int)> solve = [&](int remaining_mask) -> int {
            if (remaining_mask == 0) return 0;
            if (memo.count(remaining_mask)) return memo[remaining_mask];
            
            int first_element = __builtin_ctz(remaining_mask & -remaining_mask);
            int res = INT_MAX;
            
            for (auto& [mask, cost] : valid_subsets) {
                if ((mask & remaining_mask) == mask && ((mask >> first_element) & 1)) {
                    int next = solve(remaining_mask ^ mask);
                    if (next != INT_MAX) {
                        res = min(res, cost + next);
                    }
                }
            }
            
            memo[remaining_mask] = res;
            return res;
        };
        
        int ans = solve((1 << n) - 1);
        return ans == INT_MAX ? -1 : ans;
    }
};
