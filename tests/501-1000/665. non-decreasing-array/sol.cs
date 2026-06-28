public class Solution {
    public bool CheckPossibility(int[] nums) {
        int cntViolations = 0;
        for (int i = 1; i < nums.Length; i++) {
            if (nums[i] < nums[i - 1]) {
                if (cntViolations == 1) {
                    return false;
                }
                cntViolations++;
                if (i >= 2 && nums[i - 2] > nums[i]) {
                    nums[i] = nums[i - 1];
                }
            }
        }
        return true;
    }
}
