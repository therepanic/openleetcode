class Solution {
public:
    int numOfWays(vector<int>& nums) {
        const int MOD = 1000000007;
        int n = nums.size();
        
        vector<vector<long long>> nCr(n+1, vector<long long>(n+1, 0));
        for (int i = 0; i <= n; i++) {
            nCr[i][0] = nCr[i][i] = 1;
            for (int j = 1; j < i; j++) {
                nCr[i][j] = (nCr[i-1][j-1] + nCr[i-1][j]) % MOD;
            }
        }
        
        function<long long(vector<int>&)> dfs = [&](vector<int>& arr) -> long long {
            if (arr.size() <= 2) return 1;
            int root = arr[0];
            vector<int> left, right;
            for (int i = 1; i < arr.size(); i++) {
                if (arr[i] < root) left.push_back(arr[i]);
                else right.push_back(arr[i]);
            }
            long long leftWays = dfs(left);
            long long rightWays = dfs(right);
            int L = left.size(), R = right.size();
            return (nCr[L+R][L] * leftWays % MOD * rightWays) % MOD;
        };
        
        return (int)((dfs(nums) - 1 + MOD) % MOD);
    }
};
