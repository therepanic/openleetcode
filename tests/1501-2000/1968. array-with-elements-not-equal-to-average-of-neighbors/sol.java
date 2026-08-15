class Solution {
    public int[] rearrangeArray(int[] nums) {
        Arrays.sort(nums);
        int[] res = new int[nums.length];
        int mid = (nums.length + 1) / 2;
        for (int i = 0, j = 0; i < nums.length; i += 2, j++) {
            res[i] = nums[j];
        }
        for (int i = 1, j = mid; i < nums.length; i += 2, j++) {
            res[i] = nums[j];
        }
        return res;
    }
}
