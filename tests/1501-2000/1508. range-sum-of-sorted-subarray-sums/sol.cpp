class Solution {
public:
    int rangeSum(vector<int>& nums, int n, int left, int right) {
        const int MOD = 1000000007;
        vector<long long> sums;
        sums.reserve(n * (n + 1) / 2);
        for (int i = 0; i < n; ++i) {
            long long total = 0;
            for (int j = i; j < n; ++j) {
                total += nums[j];
                sums.push_back(total);
            }
        }
        sort(sums.begin(), sums.end());
        long long result = 0;
        for (int i = left - 1; i < right; ++i) {
            result = (result + sums[i]) % MOD;
        }
        return (int)result;
    }
};
