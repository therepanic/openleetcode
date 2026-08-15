public class Solution {
    public int MaxOperations(int[] nums, int k) {
        Array.Sort(nums);
        int i = 0, j = nums.Length - 1;
        int count = 0;

        while (i < j) {
            int total = nums[i] + nums[j];
            if (total == k) {
                count++;
                i++;
                j--;
            } else if (total > k) {
                j--;
            } else {
                i++;
            }
        }

        return count;
    }
}
