class Solution {
public:
    int minPushBox(vector<vector<char>>& grid) {
        int rows = grid.size(), cols = grid[0].size();
        pair<int,int> player, box, target;
        for (int i = 0; i < rows; ++i) {
            for (int j = 0; j < cols; ++j) {
                if (grid[i][j] == 'S') player = {i, j};
                else if (grid[i][j] == 'B') box = {i, j};
                else if (grid[i][j] == 'T') target = {i, j};
            }
        }
        
        vector<pair<int,int>> dirs = {{1,0}, {-1,0}, {0,1}, {0,-1}};
        queue<tuple<pair<int,int>, pair<int,int>, int>> q;
        q.push({box, player, 0});
        set<tuple<int,int,int,int>> seen;
        seen.insert({box.first, box.second, player.first, player.second});
        
        while (!q.empty()) {
            auto [b, p, pushes] = q.front();
            q.pop();
            if (b == target) return pushes;
            
            set<pair<int,int>> reachable;
            queue<pair<int,int>> walk;
            walk.push(p);
            reachable.insert(p);
            
            while (!walk.empty()) {
                auto [x, y] = walk.front();
                walk.pop();
                for (auto [dx, dy] : dirs) {
                    int nx = x + dx, ny = y + dy;
                    if (nx >= 0 && nx < rows && ny >= 0 && ny < cols &&
                        !(nx == b.first && ny == b.second) && grid[nx][ny] != '#' &&
                        !reachable.count({nx, ny})) {
                        reachable.insert({nx, ny});
                        walk.push({nx, ny});
                    }
                }
            }
            
            for (auto [dx, dy] : dirs) {
                pair<int,int> nextBox = {b.first + dx, b.second + dy};
                pair<int,int> behind = {b.first - dx, b.second - dy};
                if (nextBox.first >= 0 && nextBox.first < rows && nextBox.second >= 0 && nextBox.second < cols &&
                    grid[nextBox.first][nextBox.second] != '#' &&
                    reachable.count(behind) &&
                    !seen.count({nextBox.first, nextBox.second, b.first, b.second})) {
                    seen.insert({nextBox.first, nextBox.second, b.first, b.second});
                    q.push({nextBox, b, pushes + 1});
                }
            }
        }
        return -1;
    }
};
