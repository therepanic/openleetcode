class Solution {
  List<int> circularPermutation(int n, int start) {
    final int size = 1 << n;
    return List<int>.generate(size, (int i) => start ^ (i ^ (i >> 1)));
  }
}
