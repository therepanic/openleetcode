class Solution {
  List<int> sumZero(int n) {
    return List<int>.generate(n, (i) => i * 2 - n + 1);
  }
}
