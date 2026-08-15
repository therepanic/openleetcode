class Solution {
public:
    int minMoves(vector<int>& nums, int limit) {
        int n = nums.size();
        vector<int> diff(2 * limit + 2, 0);
        
        for (int i = 0; i < n / 2; i++) {
            int a = nums[i];
            int b = nums[n - 1 - i];
            int low = min(a, b) + 1;
            int high = max(a, b) + limit;
            int total = a + b;
            
            diff[2] += 2;
            diff[2 * limit + 1] -= 2;
            
            diff[low] -= 1;
            diff[high + 1] += 1;
            
            diff[total] -= 1;
            diff[total + 1] += 1;
        }
        
        int ans = INT_MAX;
        int moves = 0;
        for (int target = 2; target <= 2 * limit; target++) {
            moves += diff[target];
            ans = min(ans, moves);
        }
        
        return ans;
    }
};
