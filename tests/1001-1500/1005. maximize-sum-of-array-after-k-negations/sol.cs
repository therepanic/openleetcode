public class Solution {
    public int LargestSumAfterKNegations(int[] nums, int k) {
        Array.Sort(nums);
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] < 0 && k > 0) {
                nums[i] = -nums[i];
                k--;
            }
        }
        Array.Sort(nums);
        if (k > 0 && k % 2 != 0) {
            nums[0] = -nums[0];
        }
        int sum = 0;
        foreach (int num in nums) {
            sum += num;
        }
        return sum;
    }
}
