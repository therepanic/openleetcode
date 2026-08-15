public class Solution {
    public int MinMoves(int[] nums, int limit) {
        int n = nums.Length;
        int[] diff = new int[2 * limit + 2];
        
        for (int i = 0; i < n / 2; i++) {
            int a = nums[i];
            int b = nums[n - 1 - i];
            int low = Math.Min(a, b) + 1;
            int high = Math.Max(a, b) + limit;
            int total = a + b;
            
            diff[2] += 2;
            diff[2 * limit + 1] -= 2;
            
            diff[low] -= 1;
            diff[high + 1] += 1;
            
            diff[total] -= 1;
            diff[total + 1] += 1;
        }
        
        int ans = int.MaxValue;
        int moves = 0;
        for (int target = 2; target <= 2 * limit; target++) {
            moves += diff[target];
            ans = Math.Min(ans, moves);
        }
        
        return ans;
    }
}
