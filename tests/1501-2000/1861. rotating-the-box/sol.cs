public class Solution {
    public char[][] RotateTheBox(char[][] boxGrid) {
        int r = boxGrid.Length, c = boxGrid[0].Length;
        char[][] rotate = new char[c][];
        for (int i = 0; i < c; i++) {
            rotate[i] = new char[r];
            for (int j = 0; j < r; j++) rotate[i][j] = '.';
        }
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
