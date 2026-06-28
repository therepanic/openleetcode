class Solution {
  List<int> nextGreaterElements(List<int> nums) {
    int n = nums.length;
    List<int> res = List.filled(n, -1);
    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        if (nums[j] > nums[i]) {
          res[i] = nums[j];
          break;
        }
      }
      if (res[i] == -1) {
        for (int j = 0; j < i; j++) {
          if (nums[j] > nums[i]) {
            res[i] = nums[j];
            break;
          }
        }
      }
    }
    return res;
  }
}
