class Solution {
  int kthFactor(int n, int k) {
    List<int> ab = [];
    for (int i = 1; i <= n; i++) {
      if (n % i == 0) {
        ab.add(i);
      }
    }
    if (ab.length < k) {
      return -1;
    } else {
      return ab[k - 1];
    }
  }
}
