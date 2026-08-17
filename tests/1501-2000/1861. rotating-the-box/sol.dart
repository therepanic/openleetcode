class Solution {
  List<List<String>> rotateTheBox(List<List<String>> boxGrid) {
    int r = boxGrid.length, c = boxGrid[0].length;
    List<List<String>> rotate = List.generate(c, (_) => List.filled(r, '.'));
    for (int i = 0; i < r; i++) {
      int bottom = c - 1;
      for (int j = c - 1; j >= 0; j--) {
        if (boxGrid[i][j] == '#') {
          rotate[bottom][r - 1 - i] = '#';
          bottom--;
        } else if (boxGrid[i][j] == '*') {
          rotate[j][r - 1 - i] = '*';
          bottom = j - 1;
        }
      }
    }
    return rotate;
  }
}
