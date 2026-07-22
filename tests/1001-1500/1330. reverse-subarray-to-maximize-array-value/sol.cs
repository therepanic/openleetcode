public class Solution {
    public int MaxValueAfterReverse(int[] nums) {
        if (nums.Length < 2) return 0;
        
        int maxMin = int.MinValue;
        int minMin = int.MaxValue;
        int S = 0;
        int boundary = int.MinValue;
        
        for (int i = 0; i < nums.Length - 1; i++) {
            int a = nums[i];
            int b = nums[i + 1];
            int distance = Math.Abs(a - b);
            boundary = Math.Max(boundary, Math.Max(Math.Abs(nums[nums.Length - 1] - a), Math.Abs(nums[0] - b)) - distance);
            S += distance;
            minMin = Math.Min(Math.Max(a, b), minMin);
            maxMin = Math.Max(Math.Min(a, b), maxMin);
        }
        
        return S + Math.Max(2 * (maxMin - minMin), boundary);
    }
}
