public class Solution {
    public int WiggleMaxLength(int[] nums) {
        if (nums.Length < 2) return nums.Length;

        int up = 1, down = 1;

        for (int i = 1; i < nums.Length; i++) {
            if (nums[i] > nums[i - 1]) {
                up = down + 1;
            } else if (nums[i] < nums[i - 1]) {
                down = up + 1;
            }
        }

        return Math.Max(up, down);
    }
}
