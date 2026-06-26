public class Solution {
    public int TriangleNumber(int[] nums) {
        Array.Sort(nums);
        int n = nums.Length;
        int count = 0;
        for (int i = n - 1; i >= 0; i--) {
            int left = 0, right = i - 1;
            while (left < right) {
                if (nums[left] + nums[right] > nums[i]) {
                    count += right - left;
                    right--;
                } else {
                    left++;
                }
            }
        }
        return count;
    }
}
