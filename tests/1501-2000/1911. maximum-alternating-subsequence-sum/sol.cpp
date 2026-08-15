class Solution {

public:

    long long maxAlternatingSum(vector<int>& nums) {

        int n = nums.size();

        vector<vector<long long>> memo(n+1, vector<long long>(2, -1));

        function<long long(int, int)> solve = [&](int idx, int flag) -> long long {

            if (idx >= n) {

                return 0;

            }

            if (memo[idx][flag] != -1) {

                return memo[idx][flag];

            }

            long long skip = solve(idx+1, flag);

            long long val = nums[idx];

            if (flag == 0) {

                val = -val;

            }

            long long take = val + solve(idx+1, 1 - flag);

            memo[idx][flag] = max(skip, take);

            return memo[idx][flag];

        };

        return solve(0, 1);

    }

};
