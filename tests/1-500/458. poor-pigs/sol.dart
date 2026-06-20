class Solution {
  int poorPigs(int buckets, int minutesToDie, int minutesToTest) {
    int base = minutesToTest ~/ minutesToDie + 1;
    int ans = 0;
    int n = 1;
    while (n < buckets) {
      n *= base;
      ans++;
    }
    return ans;
  }
}
