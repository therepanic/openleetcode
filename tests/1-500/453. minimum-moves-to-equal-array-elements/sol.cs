public class Solution {
    public int MinMoves(int[] nums) {
        int sum = 0;
        int min = int.MaxValue;
        foreach (int num in nums) {
            sum += num;
            if (num < min) {
                min = num;
            }
        }
        return sum - nums.Length * min;
    }
}
