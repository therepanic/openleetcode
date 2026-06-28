public class Solution {
    public int PivotIndex(int[] nums) {
        int totalSum = 0;
        foreach (int num in nums) {
            totalSum += num;
        }
        int lSum = 0;
        int rSum = totalSum;
        for (int i = 0; i < nums.Length; i++) {
            rSum -= nums[i];
            if (lSum == rSum) {
                return i;
            }
            lSum += nums[i];
        }
        return -1;
    }
}
