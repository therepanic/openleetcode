public class Solution {
    public int[] RearrangeArray(int[] nums) {
        Array.Sort(nums);
        int[] res = new int[nums.Length];
        int mid = (nums.Length + 1) / 2;
        int j = 0;
        for (int i = 0; i < nums.Length; i += 2) {
            res[i] = nums[j++];
        }
        j = mid;
        for (int i = 1; i < nums.Length; i += 2) {
            res[i] = nums[j++];
        }
        return res;
    }
}
