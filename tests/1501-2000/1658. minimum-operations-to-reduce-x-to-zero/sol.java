class Solution {
    public int minOperations(int[] nums, int x) {
        int sub_sum = 0;
        for (int num : nums) sub_sum += num;
        sub_sum -= x;
        int n = nums.length;
        int opes = n;
        if (sub_sum == 0) return n;
        int l = 0, r = 0, sld_sum = 0;
        
        while (r < n) {
            if (sld_sum == sub_sum) {
                opes = Math.min(opes, n - (r - l));
            }
            sld_sum += nums[r];
            while (l < r && sld_sum > sub_sum) {
                sld_sum -= nums[l];
                l++;
            }
            r++;
        }

        if (sld_sum == sub_sum) {
            opes = Math.min(opes, n - (r - l));
        }

        return opes == n ? -1 : opes;
    }
}
