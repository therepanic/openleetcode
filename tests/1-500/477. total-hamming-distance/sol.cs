public class Solution {
    public int TotalHammingDistance(int[] nums) {
        int total = 0;
        int n = nums.Length;
        for (int i = 0; i < 32; i++) {
            int ones = 0;
            foreach (int num in nums) {
                ones += (num >> i) & 1;
            }
            total += ones * (n - ones);
        }
        return total;
    }
}
