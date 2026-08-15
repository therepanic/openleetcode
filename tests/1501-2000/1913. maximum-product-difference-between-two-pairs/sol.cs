public class Solution {

    public int MaxProductDifference(int[] nums) {

        Array.Sort(nums);
        int n = nums.Length;
        return (nums[n-1] * nums[n-2]) - (nums[0] * nums[1]);

    }

}
