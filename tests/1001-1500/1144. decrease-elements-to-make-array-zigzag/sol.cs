public class Solution {
    public int MovesToMakeZigzag(int[] nums) {
        int n = nums.Length;
        return Math.Min(FindValleys(nums, 0), FindValleys(nums, 1));
    }

    private int FindValleys(int[] nums, int mode) {
        int res = 0;
        int n = nums.Length;
        for (int i = 0; i < n; i++) {
            if (i % 2 == mode) {
                int left = i - 1 >= 0 ? nums[i - 1] : int.MaxValue;
                int right = i + 1 < n ? nums[i + 1] : int.MaxValue;
                int minNeighbor = Math.Min(left, right);
                if (nums[i] >= minNeighbor) {
                    res += nums[i] - (minNeighbor - 1);
                }
            }
        }
        return res;
    }
}
