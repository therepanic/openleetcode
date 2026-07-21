class Solution {
  bool kLengthApart(List<int> nums, int k) {
    if (k == 0) {
      return true;
    }
    int? prev;
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == 1) {
        if (prev != null && i - prev <= k) {
          return false;
        }
        prev = i;
      }
    }
    return true;
  }
}
