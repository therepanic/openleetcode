class Solution {
public:
    bool canMouseWin(vector<string>& grid, int catJump, int mouseJump) {
        int m = grid.size(), n = grid[0].size();
        unordered_set<int> walls;
        int food, cat, mouse;
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                int idx = i * n + j;
                if (grid[i][j] == 'F') food = idx;
                else if (grid[i][j] == 'C') cat = idx;
                else if (grid[i][j] == 'M') mouse = idx;
                else if (grid[i][j] == '#') walls.insert(idx);
            }
        }
        
        int dirs[4][2] = {{-1,0},{0,1},{1,0},{0,-1}};
        int maxTurns = m * n * 2;
        auto key = [&](int c, int mo, int turn) {
            return (c * m * n + mo) * maxTurns + turn;
        };
        unordered_map<int, bool> memo;
        
        function<bool(int,int,int)> dfs = [&](int c, int mo, int turn) -> bool {
            int k = key(c, mo, turn);
            if (memo.count(k)) return memo[k];
            
            if (c == food || c == mo || turn >= maxTurns) {
                memo[k] = false;
                return false;
            }
            if (mo == food) {
                memo[k] = true;
                return true;
            }
            
            bool result;
            if (turn % 2 == 0) { // mouse
                result = false;
                int mx = mo / n, my = mo % n;
                for (auto& d : dirs) {
                    for (int jump = 0; jump <= mouseJump; jump++) {
                        int nx = mx + jump * d[0], ny = my + jump * d[1];
                        if (nx < 0 || nx >= m || ny < 0 || ny >= n || walls.count(nx * n + ny)) break;
                        if (dfs(c, nx * n + ny, turn + 1)) {
                            result = true;
                            break;
                        }
                    }
                    if (result) break;
                }
            } else { // cat
                result = true;
                int cx = c / n, cy = c % n;
                for (auto& d : dirs) {
                    for (int jump = 0; jump <= catJump; jump++) {
                        int nx = cx + jump * d[0], ny = cy + jump * d[1];
                        if (nx < 0 || nx >= m || ny < 0 || ny >= n || walls.count(nx * n + ny)) break;
                        if (!dfs(nx * n + ny, mo, turn + 1)) {
                            result = false;
                            break;
                        }
                    }
                    if (!result) break;
                }
            }
            
            memo[k] = result;
            return result;
        };
        
        return dfs(cat, mouse, 0);
    }
};
