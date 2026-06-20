public class Solution {
    public long MinMoves2(int[] nums) {
        Array.Sort(nums);
        int median = nums[nums.Length / 2];
        long moves = 0;
        foreach (int num in nums) {
            moves += Math.Abs((long)num - median);
        }
        return moves;
    }
}
