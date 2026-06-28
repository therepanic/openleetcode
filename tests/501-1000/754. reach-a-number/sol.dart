class Solution {
  int reachNumber(int target) {
    target = target.abs();
    int n = ((-1 + sqrt(1.0 + 8.0 * target)) / 2).floor();
    int a = n * (n + 1) ~/ 2;
    int b = a + n + 1;
    
    if (a == target)
      return n;
    if ((b - target) % 2 == 0)
      return n + 1;
    return (n + 2) % 2 == 1 ? n + 2 : n + 3;
  }
}
