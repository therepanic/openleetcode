public class Solution {
    public int[] SortArrayByParity(int[] nums) {
        int left = 0;
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] % 2 == 0) {
                int temp = nums[left];
                nums[left] = nums[i];
                nums[i] = temp;
                left++;
            }
        }
        return nums;
    }
}
