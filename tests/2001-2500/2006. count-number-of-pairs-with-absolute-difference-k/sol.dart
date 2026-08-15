class Solution {
  int countKDifference(List<int> nums, int k) {
    final c = <int, int>{};
    for (var num in nums) {
      c[num] = (c[num] ?? 0) + 1;
    }
    var ans = 0;
    c.forEach((x, cnt) {
      ans += cnt * (c[x + k] ?? 0);
    });
    return ans;
  }
}
