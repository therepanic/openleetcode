class Solution {
public:
    int numSubseq(vector<int>& nums, int target) {
        const int mod = 1000000007;
        sort(nums.begin(), nums.end());
        int n = nums.size();

        vector<int> power(n, 1);
        for (int i = 1; i < n; i++) {
            power[i] = (power[i - 1] * 2) % mod;
        }

        int left = 0, right = n - 1;
        int result = 0;

        while (left <= right) {
            if (nums[left] + nums[right] <= target) {
                result = (result + power[right - left]) % mod;
                left++;
            } else {
                right--;
            }
        }

        return result;
    }
};
