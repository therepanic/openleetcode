class Solution {
  int subarraysDivByK(List<int> nums, int k) {
    int s = 0;
    int res = 0;
    Map<int, int> hs = {0: 1};
    for (int num in nums) {
      s += num;
      int rem = s % k;
      if (rem < 0) rem += k;
      res += hs[rem] ?? 0;
      hs[rem] = (hs[rem] ?? 0) + 1;
    }
    return res;
  }
}
