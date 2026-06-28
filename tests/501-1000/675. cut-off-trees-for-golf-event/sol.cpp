class Solution {
public:
    int cutOffTree(vector<vector<int>>& forest) {
        int rows = forest.size();
        int cols = forest[0].size();
        
        if (forest[0][0] == 0) return -1;
        
        vector<tuple<int, int, int>> trees;
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                if (forest[r][c] > 1) {
                    trees.emplace_back(forest[r][c], r, c);
                }
            }
        }
        
        sort(trees.begin(), trees.end());
        
        auto findShortestPath = [&](int startRow, int startCol, 
                                     int targetRow, int targetCol) -> int {
            vector<vector<int>> directions = {{-1, 0}, {0, -1}, {0, 1}, {1, 0}};
            queue<tuple<int, int, int>> q;
            vector<vector<bool>> visited(rows, vector<bool>(cols, false));
            
            q.emplace(startRow, startCol, 0);
            visited[startRow][startCol] = true;
            
            while (!q.empty()) {
                auto [currRow, currCol, steps] = q.front();
                q.pop();
                
                if (currRow == targetRow && currCol == targetCol) {
                    return steps;
                }
                
                for (auto& dir : directions) {
                    int newRow = currRow + dir[0];
                    int newCol = currCol + dir[1];
                    
                    if (newRow >= 0 && newRow < rows && newCol >= 0 && newCol < cols &&
                        forest[newRow][newCol] > 0 && !visited[newRow][newCol]) {
                        q.emplace(newRow, newCol, steps + 1);
                        visited[newRow][newCol] = true;
                    }
                }
            }
            
            return -1;
        };
        
        int totalSteps = 0;
        int currentRow = 0, currentCol = 0;
        
        for (auto& [height, targetRow, targetCol] : trees) {
            int steps = findShortestPath(currentRow, currentCol, targetRow, targetCol);
            if (steps == -1) return -1;
            
            totalSteps += steps;
            currentRow = targetRow;
            currentCol = targetCol;
        }
        
        return totalSteps;
    }
};
