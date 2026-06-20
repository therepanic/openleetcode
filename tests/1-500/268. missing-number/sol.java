class Solution {
    public int missingNumber(int[] nums) {
        int l = nums.length;
        int total = l;
        int summ = 0;
        for (int i = 0; i < l; i++) {
            total += i;
            summ += nums[i];
        }
        return total - summ;
    }
}
