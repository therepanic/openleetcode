class Solution {
  String convert(String s, int numRows) {
    if (numRows == 1 || numRows >= s.length) {
      return s;
    }

    final rows = List<StringBuffer>.generate(numRows, (_) => StringBuffer());
    var idx = 0;
    var step = 1;

    for (var i = 0; i < s.length; i++) {
      rows[idx].writeCharCode(s.codeUnitAt(i));
      if (idx == 0) {
        step = 1;
      } else if (idx == numRows - 1) {
        step = -1;
      }
      idx += step;
    }

    return rows.map((row) => row.toString()).join();
  }
}
