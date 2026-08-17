public class Solution {
    public int SubsetXORSum(int[] nums) {
        int total = 0;
        foreach (int num in nums) {
            total |= num;
        }
        return total * (1 << (nums.Length - 1));
    }
}
