class Solution {
  List<bool> prefixesDivBy5(List<int> nums) {
    List<bool> ans = [];
    int val = 0;
    for (int bit in nums) {
      val = (val * 2 + bit) % 5;
      ans.add(val == 0);
    }
    return ans;
  }
}
