class Solution {
  List<int> numberOfLines(List<int> widths, String s) {
    int lines = 1;
    int current = 0;

    for (int codeUnit in s.codeUnits) {
      int width = widths[codeUnit - 97];
      if (current + width > 100) {
        lines++;
        current = width;
      } else {
        current += width;
      }
    }

    return [lines, current];
  }
}
