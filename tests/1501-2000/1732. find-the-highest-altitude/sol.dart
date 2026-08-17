class Solution {
  int largestAltitude(List<int> gain) {
    int ans = 0, acc = 0;
    for (int it in gain) {
      acc += it;
      int d = acc - ans;
      ans += d & ~(d >> 31);
    }
    return ans;
  }
}
