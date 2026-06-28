class Solution {
public:
    int slidingPuzzle(vector<vector<int>>& board) {
        const string target = "123450";
        string start;
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 3; j++) {
                start += to_string(board[i][j]);
            }
        }
        
        unordered_map<int, vector<int>> neighbors = {
            {0, {1, 3}}, {1, {0, 2, 4}}, {2, {1, 5}},
            {3, {0, 4}}, {4, {1, 3, 5}}, {5, {2, 4}}
        };
        
        queue<pair<string, int>> q;
        unordered_set<string> visited;
        
        q.push({start, 0});
        visited.insert(start);
        
        while (!q.empty()) {
            auto [state, moves] = q.front();
            q.pop();
            
            if (state == target) {
                return moves;
            }
            
            int zeroIndex = state.find('0');
            
            for (int neighbor : neighbors[zeroIndex]) {
                string newState = state;
                swap(newState[zeroIndex], newState[neighbor]);
                
                if (visited.find(newState) == visited.end()) {
                    visited.insert(newState);
                    q.push({newState, moves + 1});
                }
            }
        }
        
        return -1;
    }
};
