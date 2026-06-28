class Solution {
    public boolean checkPossibility(int[] nums) {
        int cnt_violations = 0;
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] < nums[i - 1]) {
                if (cnt_violations == 1) {
                    return false;
                }
                cnt_violations++;
                if (i >= 2 && nums[i - 2] > nums[i]) {
                    nums[i] = nums[i - 1];
                }
            }
        }
        return true;
    }
}
