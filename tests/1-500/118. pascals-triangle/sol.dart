
class Solution {
  List<List<int>> generate(int numRows) {
    final result = <List<int>>[];
    for (var i = 0; i < numRows; i++) {
      final row = List<int>.filled(i + 1, 1);
      for (var j = 1; j < i; j++) {
        row[j] = result[i - 1][j - 1] + result[i - 1][j];
      }
      result.add(row);
    }
    return result;
  }
}
