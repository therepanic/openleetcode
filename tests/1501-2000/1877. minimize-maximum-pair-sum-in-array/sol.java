class Solution {
    public int minPairSum(int[] nums) {
        Arrays.sort(nums);
        int max_sum = 0;
        int l = 0, r = nums.length - 1;
        while (l < r) {
            max_sum = Math.max(max_sum, nums[l] + nums[r]);
            l++;
            r--;
        }
        return max_sum;
    }
}
