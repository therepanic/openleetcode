class Solution {
public:
    int minOperations(vector<int>& nums, int x) {
        int sub_sum = accumulate(nums.begin(), nums.end(), 0) - x;
        int n = nums.size();
        int opes = n;
        if (sub_sum == 0) return n;
        int l = 0, r = 0, sld_sum = 0;
        
        while (r < n) {
            if (sld_sum == sub_sum) {
                opes = min(opes, n - (r - l));
            }
            sld_sum += nums[r];
            while (l < r && sld_sum > sub_sum) {
                sld_sum -= nums[l];
                l++;
            }
            r++;
        }

        if (sld_sum == sub_sum) {
            opes = min(opes, n - (r - l));
        }

        return opes == n ? -1 : opes;
    }
};
