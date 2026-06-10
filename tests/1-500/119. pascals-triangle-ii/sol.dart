
class Solution {
  List<int> getRow(int rowIndex) {
    var row = <int>[1];
    for (var i = 0; i < rowIndex; i++) {
      final next = List<int>.filled(row.length + 1, 1);
      for (var j = 1; j < row.length; j++) {
        next[j] = row[j - 1] + row[j];
      }
      row = next;
    }
    return row;
  }
}
