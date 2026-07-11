class Solution {
public:
    int snakesAndLadders(vector<vector<int>>& board) {
        int n = board.size();
        vector<int> minRolls(n * n + 1, -1);
        queue<int> q;
        minRolls[1] = 0;
        q.push(1);

        while (!q.empty()) {
            int x = q.front();
            q.pop();
            for (int i = 1; i <= 6; i++) {
                int t = x + i;
                if (t > n * n) break;
                int row = (t - 1) / n;
                int col = (t - 1) % n;
                int r = n - 1 - row;
                int c = (row % 2 == 1) ? (n - 1 - col) : col;
                int v = board[r][c];
                int y = v > 0 ? v : t;
                if (y == n * n) return minRolls[x] + 1;
                if (minRolls[y] == -1) {
                    minRolls[y] = minRolls[x] + 1;
                    q.push(y);
                }
            }
        }
        return -1;
    }
};
