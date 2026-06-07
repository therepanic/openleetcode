class Solution {
  String getPermutation(int n, int k) {
    final nums = <int>[];
    final factorial = List.filled(n + 1, 1);

    for (var i = 1; i <= n; i++) {
      nums.add(i);
      factorial[i] = factorial[i - 1] * i;
    }

    k--;
    final res = StringBuffer();
    for (var remaining = n; remaining >= 1; remaining--) {
      final block = factorial[remaining - 1];
      final idx = k ~/ block;
      k %= block;
      res.write(nums[idx]);
      nums.removeAt(idx);
    }
    return res.toString();
  }
}
