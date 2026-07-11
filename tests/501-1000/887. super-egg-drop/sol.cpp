class Solution {
public:
    int superEggDrop(int k, int n) {
        vector<vector<int>> memo(k + 1, vector<int>(n + 1, -1));
        
        function<int(int, int)> solve = [&](int eggs, int floors) -> int {
            if (floors <= 1 || eggs == 1) {
                return floors;
            }
            if (memo[eggs][floors] != -1) {
                return memo[eggs][floors];
            }
            
            int low = 1, high = floors;
            int ans = floors;
            
            while (low <= high) {
                int mid = (low + high) / 2;
                int breakCase = solve(eggs - 1, mid - 1);
                int notBreakCase = solve(eggs, floors - mid);
                
                ans = min(ans, 1 + max(breakCase, notBreakCase));
                if (breakCase < notBreakCase) {
                    low = mid + 1;
                } else {
                    high = mid - 1;
                }
            }
            
            memo[eggs][floors] = ans;
            return ans;
        };
        
        return solve(k, n);
    }
};
