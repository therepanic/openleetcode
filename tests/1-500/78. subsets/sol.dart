class Solution {
  List<List<int>> subsets(List<int> nums) {
    final res = <List<int>>[
      <int>[],
    ];
    for (final x in nums) {
      final sz = res.length;
      for (var i = 0; i < sz; i++) {
        res.add(List<int>.from(res[i])..add(x));
      }
    }
    return res;
  }
}
