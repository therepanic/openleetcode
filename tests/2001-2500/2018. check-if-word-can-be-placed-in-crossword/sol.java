class Solution {
    public boolean placeWordInCrossword(char[][] board, String word) {
        java.util.function.BiPredicate<String, String> canPlace = (segment, w) -> {
            if (segment.length() != w.length()) return false;
            for (int i = 0; i < segment.length(); i++) {
                char c = segment.charAt(i);
                if (c != ' ' && c != w.charAt(i)) return false;
            }
            return true;
        };
        
        int m = board.length, n = board[0].length;
        String reversedWord = new StringBuilder(word).reverse().toString();
        
        for (char[] row : board) {
            for (String part : new String(row).split("#")) {
                if (!part.isEmpty() && (canPlace.test(part, word) || canPlace.test(part, reversedWord))) return true;
            }
        }
        
        for (int j = 0; j < n; j++) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < m; i++) sb.append(board[i][j]);
            for (String part : sb.toString().split("#")) {
                if (!part.isEmpty() && (canPlace.test(part, word) || canPlace.test(part, reversedWord))) return true;
            }
        }
        return false;
    }
}
