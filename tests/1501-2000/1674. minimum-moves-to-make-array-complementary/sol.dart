class Solution {
  int minMoves(List<int> nums, int limit) {
    int n = nums.length;
    List<int> diff = List.filled(2 * limit + 2, 0);
    
    for (int i = 0; i < n ~/ 2; i++) {
      int a = nums[i];
      int b = nums[n - 1 - i];
      int low = (a < b ? a : b) + 1;
      int high = (a > b ? a : b) + limit;
      int total = a + b;
      
      diff[2] += 2;
      diff[2 * limit + 1] -= 2;
      
      diff[low] -= 1;
      diff[high + 1] += 1;
      
      diff[total] -= 1;
      diff[total + 1] += 1;
    }
    
    int ans = 1 << 31 - 1; // MaxInt
    int moves = 0;
    for (int target = 2; target <= 2 * limit; target++) {
      moves += diff[target];
      if (moves < ans) ans = moves;
    }
    
    return ans;
  }
}
