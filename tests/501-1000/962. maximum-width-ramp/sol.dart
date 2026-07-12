class Solution {
  int maxWidthRamp(List<int> nums) {
    int n = nums.length;
    List<int> right_max = List.filled(n, 0);
    right_max[n - 1] = nums[n - 1];
    
    for (int i = n - 2; i >= 0; i--) {
      right_max[i] = nums[i] > right_max[i + 1] ? nums[i] : right_max[i + 1];
    }
    
    int i = 0, j = 0, result = 0;
    while (j < n) {
      if (nums[i] <= right_max[j]) {
        if (j - i > result) {
          result = j - i;
        }
        j++;
      } else {
        i++;
      }
    }
    
    return result;
  }
}
