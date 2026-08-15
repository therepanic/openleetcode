class Solution {
  int minimumMountainRemovals(List<int> nums) {
    int n = nums.length;
    List<int> lis = List.filled(n, 1);
    List<int> lds = List.filled(n, 1);

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < i; j++) {
        if (nums[i] > nums[j]) {
          if (lis[j] + 1 > lis[i]) {
            lis[i] = lis[j] + 1;
          }
        }
      }
    }

    for (int i = n - 1; i >= 0; i--) {
      for (int j = n - 1; j > i; j--) {
        if (nums[i] > nums[j]) {
          if (lds[j] + 1 > lds[i]) {
            lds[i] = lds[j] + 1;
          }
        }
      }
    }

    int maxLen = 0;
    for (int i = 1; i < n - 1; i++) {
      if (lis[i] > 1 && lds[i] > 1) {
        int len = lis[i] + lds[i] - 1;
        if (len > maxLen) {
          maxLen = len;
        }
      }
    }

    return n - maxLen;
  }
}
