class Solution {
    public int countBattleships(String[][] board) {
        int count = 0;
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board[0].length; j++) {
                if (board[i][j].equals("X") && 
                    (i == 0 || board[i-1][j].equals(".")) && 
                    (j == 0 || board[i][j-1].equals("."))) {
                    count++;
                }
            }
        }
        return count;
    }
}
