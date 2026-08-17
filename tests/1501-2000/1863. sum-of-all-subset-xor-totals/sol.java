class Solution {
    public int subsetXORSum(int[] nums) {
        int total = 0;
        for (int num : nums) {
            total |= num;
        }
        return total * (1 << (nums.length - 1));
    }
}
