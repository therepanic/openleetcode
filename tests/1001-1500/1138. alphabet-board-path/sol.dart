class Solution {
  String alphabetBoardPath(String target) {
    int r = 0;
    int c = 0;
    final buffer = StringBuffer();

    for (int i = 0; i < target.length; i++) {
      int code = target.codeUnitAt(i) - 97;
      int nr = code ~/ 5;
      int nc = code % 5;

      if (nr == 5) {
        while (c > nc) {
          buffer.write('L');
          c--;
        }
        while (c < nc) {
          buffer.write('R');
          c++;
        }
        while (r > nr) {
          buffer.write('U');
          r--;
        }
        while (r < nr) {
          buffer.write('D');
          r++;
        }
      } else {
        while (r > nr) {
          buffer.write('U');
          r--;
        }
        while (r < nr) {
          buffer.write('D');
          r++;
        }
        while (c > nc) {
          buffer.write('L');
          c--;
        }
        while (c < nc) {
          buffer.write('R');
          c++;
        }
      }

      buffer.write('!');
    }

    return buffer.toString();
  }
}
