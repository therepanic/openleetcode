class Solution {
    public int movesToMakeZigzag(int[] nums) {
        int n = nums.length;
        return Math.min(findValleys(nums, 0), findValleys(nums, 1));
    }

    private int findValleys(int[] nums, int mode) {
        int res = 0;
        int n = nums.length;
        for (int i = 0; i < n; i++) {
            if (i % 2 == mode) {
                int left = i - 1 >= 0 ? nums[i - 1] : Integer.MAX_VALUE;
                int right = i + 1 < n ? nums[i + 1] : Integer.MAX_VALUE;
                int minNeighbor = Math.min(left, right);
                if (nums[i] >= minNeighbor) {
                    res += nums[i] - (minNeighbor - 1);
                }
            }
        }
        return res;
    }
}
