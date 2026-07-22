class Solution {
  int rangeSum(List<int> nums, int n, int left, int right) {
    const int MOD = 1000000007;
    List<int> sums = [];
    for (int i = 0; i < n; i++) {
      int total = 0;
      for (int j = i; j < n; j++) {
        total += nums[j];
        sums.add(total);
      }
    }
    sums.sort();
    int result = 0;
    for (int i = left - 1; i < right; i++) {
      result = (result + sums[i]) % MOD;
    }
    return result;
  }
}
