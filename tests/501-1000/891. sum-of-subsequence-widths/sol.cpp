class Solution {
public:
    int sumSubseqWidths(vector<int>& nums) {
        const int mod = 1000000007;
        sort(nums.begin(), nums.end());
        int n = nums.size();
        long long ans = 0;
        long long factor = 1;
        for (int i = 0; i < n; i++) {
            ans = (ans + (nums[i] - nums[n - 1 - i]) * factor) % mod;
            factor = (factor * 2) % mod;
        }
        return (int) ans;
    }
};
