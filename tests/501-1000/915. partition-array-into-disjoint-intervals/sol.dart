class Solution {
  int partitionDisjoint(List<int> nums) {
    int n = nums.length;
    List<int> prefixMax = List.filled(n, 0);
    prefixMax[0] = nums[0];
    for (int i = 1; i < n; i++) {
      prefixMax[i] = nums[i] > prefixMax[i-1] ? nums[i] : prefixMax[i-1];
    }
    
    List<int> suffixMin = List.filled(n, 0);
    suffixMin[n-1] = nums[n-1];
    for (int i = n-2; i >= 0; i--) {
      suffixMin[i] = nums[i] < suffixMin[i+1] ? nums[i] : suffixMin[i+1];
    }
    
    for (int i = 0; i < n-1; i++) {
      if (prefixMax[i] <= suffixMin[i+1]) {
        return i + 1;
      }
    }
    return -1;
  }
}
