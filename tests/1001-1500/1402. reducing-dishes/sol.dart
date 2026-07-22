class Solution {
  int maxSatisfaction(List<int> satisfaction) {
    satisfaction.sort((a, b) => b.compareTo(a));
    int presum = 0, res = 0;
    for (int s in satisfaction) {
      presum += s;
      if (presum < 0) break;
      res += presum;
    }
    return res;
  }
}
