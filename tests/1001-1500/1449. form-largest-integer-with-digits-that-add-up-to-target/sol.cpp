class Solution {
public:
    string largestNumber(vector<int>& cost, int target) {
        int N = cost.size();
        vector<vector<int>> memo(N + 1, vector<int>(target + 1, -1));
        
        function<int(int,int)> helper = [&](int i, int c) -> int {
            if (c == 0) return 0;
            if (i == N || c < 0) return INT_MIN;
            if (memo[i][c] != -1) return memo[i][c];
            int take = helper(i, c - cost[i]);
            if (take != INT_MIN) take += 1;
            int notTake = helper(i + 1, c);
            memo[i][c] = max(take, notTake);
            return memo[i][c];
        };
        
        int e = helper(0, target);
        if (e == INT_MIN) return "0";
        
        string s = "";
        int t = target;
        for (int k = 0; k < e; k++) {
            for (int j = 9; j >= 1; j--) {
                if (cost[j-1] <= t && helper(0, t - cost[j-1]) == e - k - 1) {
                    t -= cost[j-1];
                    s += to_string(j);
                    break;
                }
            }
        }
        return s;
    }
};
