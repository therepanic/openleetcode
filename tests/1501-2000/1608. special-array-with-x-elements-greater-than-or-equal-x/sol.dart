class Solution {
  int specialArray(List<int> nums) {
    List<int> ans = List.filled(nums.length + 1, 0);
    for (int i = 0; i <= nums.length; i++) {
      int count = 0;
      for (int ele in nums) {
        if (i <= ele) count++;
      }
      ans[i] = count;
      if (ans[i] == i) return i;
    }
    return -1;
  }
}
