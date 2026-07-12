class Solution {
public:
    int catMouseGame(vector<vector<int>>& graph) {
        const int MOUSE = 0;
        const int CAT = 1;
        const int MOUSE_WIN = 1;
        const int CAT_WIN = 2;
        const int DRAW = 0;
        
        int n = graph.size();
        map<tuple<int, int, int>, int> results;
        for (int i = 1; i < n; i++) {
            results[{0, i, CAT}] = MOUSE_WIN;
            results[{0, i, MOUSE}] = MOUSE_WIN;
            results[{i, i, CAT}] = CAT_WIN;
            results[{i, i, MOUSE}] = CAT_WIN;
        }
        
        map<tuple<int, int, int>, int> degree;
        for (int mouse = 1; mouse < n; mouse++) {
            for (int cat = 1; cat < n; cat++) {
                degree[{mouse, cat, MOUSE}] = graph[mouse].size();
                int catDeg = graph[cat].size();
                for (int x : graph[cat]) {
                    if (x == 0) {
                        catDeg--;
                        break;
                    }
                }
                degree[{mouse, cat, CAT}] = catDeg;
            }
        }
        
        queue<tuple<int, int, int>> q;
        for (auto& [state, _] : results) {
            q.push(state);
        }
        
        while (!q.empty()) {
            auto [mouse, cat, turn] = q.front();
            q.pop();
            int curResult = results[{mouse, cat, turn}];
            
            vector<tuple<int, int, int>> prevStates;
            if (turn == MOUSE) {
                for (int prevCat : graph[cat]) {
                    prevStates.push_back({mouse, prevCat, CAT});
                }
            } else {
                for (int prevMouse : graph[mouse]) {
                    prevStates.push_back({prevMouse, cat, MOUSE});
                }
            }
            
            for (auto& prevState : prevStates) {
                if (results.count(prevState)) continue;
                auto [prevMouse, prevCat, prevTurn] = prevState;
                if (prevCat == 0) continue;
                
                degree[prevState]--;
                bool isMoverWinner = ((curResult == MOUSE_WIN && prevTurn == MOUSE) ||
                                      (curResult == CAT_WIN && prevTurn == CAT));
                if (isMoverWinner || degree[prevState] == 0) {
                    results[prevState] = curResult;
                    q.push(prevState);
                }
            }
        }
        
        if (results.count({1, 2, MOUSE})) {
            return results[{1, 2, MOUSE}];
        }
        return DRAW;
    }
};
