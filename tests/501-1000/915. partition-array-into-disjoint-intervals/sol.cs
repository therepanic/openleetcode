public class Solution {
    public int PartitionDisjoint(int[] nums) {
        int n = nums.Length;
        int[] prefixMax = new int[n];
        prefixMax[0] = nums[0];
        for (int i = 1; i < n; i++) {
            prefixMax[i] = Math.Max(prefixMax[i-1], nums[i]);
        }
        
        int[] suffixMin = new int[n];
        suffixMin[n-1] = nums[n-1];
        for (int i = n-2; i >= 0; i--) {
            suffixMin[i] = Math.Min(suffixMin[i+1], nums[i]);
        }
        
        for (int i = 0; i < n-1; i++) {
            if (prefixMax[i] <= suffixMin[i+1]) {
                return i + 1;
            }
        }
        return -1;
    }
}
