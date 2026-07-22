class Solution {
  int maxNumberOfBalloons(String text) {
    var f = <String, int>{};
    for (var c in text.split('')) {
      f[c] = (f[c] ?? 0) + 1;
    }
    return [f['b'] ?? 0, f['a'] ?? 0, (f['l'] ?? 0) ~/ 2, (f['o'] ?? 0) ~/ 2, f['n'] ?? 0].reduce((a, b) => a < b ? a : b);
  }
}
