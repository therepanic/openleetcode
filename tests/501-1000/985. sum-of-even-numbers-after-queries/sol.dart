class Solution {
  List<int> sumEvenAfterQueries(List<int> nums, List<List<int>> queries) {
    int total = nums.where((x) => x % 2 == 0).fold(0, (a, b) => a + b);
    List<int> ans = [];
    for (var q in queries) {
      int val = q[0];
      int idx = q[1];
      if (nums[idx] % 2 == 0) total -= nums[idx];
      nums[idx] += val;
      if (nums[idx] % 2 == 0) total += nums[idx];
      ans.add(total);
    }
    return ans;
  }
}
