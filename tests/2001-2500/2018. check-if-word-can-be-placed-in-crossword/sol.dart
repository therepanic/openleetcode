class Solution {
  bool placeWordInCrossword(List<List<String>> board, String word) {
    bool canPlace(String segment, String w) {
      if (segment.length != w.length) return false;
      for (int i = 0; i < segment.length; i++) {
        if (segment[i] != ' ' && segment[i] != w[i]) return false;
      }
      return true;
    }
    
    int m = board.length, n = board[0].length;
    String reversedWord = word.split('').reversed.join();
    
    for (var row in board) {
      var parts = row.join().split('#');
      for (var part in parts) {
        if (part.isNotEmpty && (canPlace(part, word) || canPlace(part, reversedWord))) return true;
      }
    }
    
    for (int j = 0; j < n; j++) {
      var col = List.generate(m, (i) => board[i][j]).join();
      var parts = col.split('#');
      for (var part in parts) {
        if (part.isNotEmpty && (canPlace(part, word) || canPlace(part, reversedWord))) return true;
      }
    }
    return false;
  }
}
