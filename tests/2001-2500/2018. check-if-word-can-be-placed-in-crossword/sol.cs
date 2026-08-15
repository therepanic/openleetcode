public class Solution {
    public bool PlaceWordInCrossword(char[][] board, string word) {
        bool CanPlace(string segment, string w) {
            if (segment.Length != w.Length) return false;
            for (int i = 0; i < segment.Length; i++) {
                if (segment[i] != ' ' && segment[i] != w[i]) return false;
            }
            return true;
        }
        
        int m = board.Length, n = board[0].Length;
        string reversedWord = new string(word.Reverse().ToArray());
        
        foreach (var row in board) {
            string rowStr = new string(row);
            foreach (var part in rowStr.Split('#')) {
                if (!string.IsNullOrEmpty(part) && (CanPlace(part, word) || CanPlace(part, reversedWord))) return true;
            }
        }
        
        for (int j = 0; j < n; j++) {
            char[] col = new char[m];
            for (int i = 0; i < m; i++) col[i] = board[i][j];
            string colStr = new string(col);
            foreach (var part in colStr.Split('#')) {
                if (!string.IsNullOrEmpty(part) && (CanPlace(part, word) || CanPlace(part, reversedWord))) return true;
            }
        }
        return false;
    }
}
