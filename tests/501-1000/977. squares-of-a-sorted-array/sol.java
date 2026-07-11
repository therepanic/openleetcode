class Solution {
    public int[] sortedSquares(int[] nums) {
        int[] newarr = new int[nums.length];
        for (int i = 0; i < nums.length; i++) {
            newarr[i] = nums[i] * nums[i];
        }
        Arrays.sort(newarr);
        return newarr;
    }
}
