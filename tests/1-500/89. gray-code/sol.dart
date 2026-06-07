class Solution {
  List<int> grayCode(int n) {
    final total = 1 << n;
    final res = <int>[];
    for (var i = 0; i < total; i++) {
      res.add(i ^ (i >> 1));
    }
    return res;
  }
}
