public class Solution {
    public int FindUnsortedSubarray(int[] nums) {
        int[] sortedNums = (int[])nums.Clone();
        Array.Sort(sortedNums);
        int start = nums.Length, end = 0;

        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] != sortedNums[i]) {
                start = Math.Min(start, i);
                end = Math.Max(end, i);
            }
        }

        return end - start >= 0 ? end - start + 1 : 0;
    }
}
