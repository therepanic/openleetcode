class Solution {
  List<int> getConcatenation(List<int> nums) {
    int n = nums.length;
    List<int> ans = List.filled(2 * n, 0);
    for (int i = 0; i < 2 * n; i++) {
      ans[i] = nums[i % n];
    }
    return ans;
  }
}
