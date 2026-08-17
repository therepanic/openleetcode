class Solution {
  int countPairs(List<int> deliciousness) {
    const int MOD = 1000000007;
    int maxVal = 0;
    for (int d in deliciousness) {
      if (d > maxVal) maxVal = d;
    }
    List<int> powers = List.generate(22, (i) => 1 << i);
    Map<int, int> count = {};
    int res = 0;

    for (int val in deliciousness) {
      for (int target in powers) {
        int complement = target - val;
        if (count.containsKey(complement)) {
          res += count[complement]!;
          res %= MOD;
        }
      }
      count[val] = (count[val] ?? 0) + 1;
    }
    return res;
  }
}
