class Solution {
public:
    bool checkMove(vector<vector<char>>& board, int rMove, int cMove, char color) {
        char opposite = (color == 'B') ? 'W' : 'B';
        int dirs[8][2] = {{-1,-1},{-1,0},{-1,1},{0,-1},{0,1},{1,-1},{1,0},{1,1}};

        for (int i = 0; i < 8; ++i) {
            int r = rMove + dirs[i][0];
            int c = cMove + dirs[i][1];
            int cnt = 0;

            while (r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == opposite) {
                r += dirs[i][0];
                c += dirs[i][1];
                cnt++;
            }

            if (cnt >= 1 && r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == color) {
                return true;
            }
        }

        return false;
    }
};
