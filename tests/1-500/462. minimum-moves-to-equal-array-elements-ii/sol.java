import java.util.Arrays;

class Solution {
    public long minMoves2(int[] nums) {
        Arrays.sort(nums);
        int median = nums[nums.length / 2];
        long moves = 0;
        for (int num : nums) {
            moves += Math.abs((long) num - median);
        }
        return moves;
    }
}
