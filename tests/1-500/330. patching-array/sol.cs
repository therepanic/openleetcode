public class Solution {
    public int MinPatches(int[] nums, int n) {
        long currentSum = 1;
        int patches = 0;
        int index = 0;
        
        while (currentSum <= n) {
            if (index < nums.Length && nums[index] <= currentSum) {
                currentSum += nums[index];
                index++;
            } else {
                currentSum += currentSum;
                patches++;
            }
        }
        
        return patches;
    }
}
