class Solution {
  int minStartValue(List<int> nums) {
    int curr = 0, ans = 0;
    for (int i in nums) {
      curr += i;
      if (curr < ans) {
        ans = curr;
      }
    }
    return ans > 1 - ans ? ans : 1 - ans;
  }
}
