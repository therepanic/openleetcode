public class Solution {
    public int[] SortedSquares(int[] nums) {
        int[] newarr = new int[nums.Length];
        for (int i = 0; i < nums.Length; i++) {
            newarr[i] = nums[i] * nums[i];
        }
        Array.Sort(newarr);
        return newarr;
    }
}
