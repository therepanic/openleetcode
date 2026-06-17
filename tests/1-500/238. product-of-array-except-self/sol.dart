class Solution {
  List<int> productExceptSelf(List<int> nums) {
    int n = nums.length;
    List<int> res = List.filled(n, 0);

    int pre = 1;
    for (int i = 0; i < n; i++) {
      res[i] = pre;
      pre *= nums[i];
    }

    int suf = 1;
    for (int i = n - 1; i >= 0; i--) {
      res[i] *= suf;
      suf *= nums[i];
    }

    return res;
  }
}
