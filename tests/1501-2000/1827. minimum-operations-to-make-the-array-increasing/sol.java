class Solution {
    public int minOperations(int[] nums) {
        int c = nums[0];
        int s = 0;
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] > c) {
                c = nums[i];
            } else {
                c++;
                s += c - nums[i];
            }
        }
        return s;
    }
}
