class Solution {
public:
    int minDays(vector<vector<int>>& grid) {
        auto countIslands = [&]() {
            int rows = grid.size(), cols = grid[0].size();
            vector<vector<bool>> seen(rows, vector<bool>(cols, false));
            int islands = 0;
            int dirs[4][2] = {{-1,0},{1,0},{0,-1},{0,1}};
            
            for (int i = 0; i < rows; i++) {
                for (int j = 0; j < cols; j++) {
                    if (grid[i][j] == 1 && !seen[i][j]) {
                        islands++;
                        stack<pair<int,int>> st;
                        st.push({i,j});
                        seen[i][j] = true;
                        while (!st.empty()) {
                            auto [x,y] = st.top();
                            st.pop();
                            for (auto& d : dirs) {
                                int nx = x + d[0], ny = y + d[1];
                                if (nx >= 0 && nx < rows && ny >= 0 && ny < cols && grid[nx][ny] == 1 && !seen[nx][ny]) {
                                    seen[nx][ny] = true;
                                    st.push({nx,ny});
                                }
                            }
                        }
                    }
                }
            }
            return islands;
        };
        
        if (countIslands() != 1) return 0;
        
        for (int i = 0; i < grid.size(); i++) {
            for (int j = 0; j < grid[0].size(); j++) {
                if (grid[i][j] == 1) {
                    grid[i][j] = 0;
                    if (countIslands() != 1) return 1;
                    grid[i][j] = 1;
                }
            }
        }
        return 2;
    }
};
