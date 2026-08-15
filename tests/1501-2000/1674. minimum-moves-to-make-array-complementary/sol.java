class Solution {
    public int minMoves(int[] nums, int limit) {
        int n = nums.length;
        int[] diff = new int[2 * limit + 2];
        
        for (int i = 0; i < n / 2; i++) {
            int a = nums[i];
            int b = nums[n - 1 - i];
            int low = Math.min(a, b) + 1;
            int high = Math.max(a, b) + limit;
            int total = a + b;
            
            diff[2] += 2;
            diff[2 * limit + 1] -= 2;
            
            diff[low] -= 1;
            diff[high + 1] += 1;
            
            diff[total] -= 1;
            diff[total + 1] += 1;
        }
        
        int ans = Integer.MAX_VALUE;
        int moves = 0;
        for (int target = 2; target <= 2 * limit; target++) {
            moves += diff[target];
            ans = Math.min(ans, moves);
        }
        
        return ans;
    }
}
