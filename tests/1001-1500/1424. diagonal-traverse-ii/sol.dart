class Solution {
  List<int> findDiagonalOrder(List<List<int>> nums) {
    List<List<int>> l = [];
    for (int i = 0; i < nums.length; i++) {
      for (int j = 0; j < nums[i].length; j++) {
        l.add([i + j, i, j]);
      }
    }

    Map<int, List<int>> h = {};
    for (var triple in l) {
      int sum = triple[0], i = triple[1], j = triple[2];
      h.putIfAbsent(sum, () => []);
      h[sum]!.add(nums[i][j]);
    }

    List<int> keys = h.keys.toList()..sort();
    List<int> result = [];
    for (int key in keys) {
      result.addAll(h[key]!.reversed);
    }
    return result;
  }
}
