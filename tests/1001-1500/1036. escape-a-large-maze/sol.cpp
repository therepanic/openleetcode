class Solution {
public:
    bool isEscapePossible(vector<vector<int>>& blocked, vector<int>& source, vector<int>& target) {
        set<pair<int, int>> blockedSet;
        for (auto& b : blocked) {
            blockedSet.insert({b[0], b[1]});
        }
        int MAX = blocked.size() * blocked.size() / 2;
        vector<pair<int, int>> dirs = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};

        auto bfs = [&](vector<int>& start, vector<int>& end) -> bool {
            set<pair<int, int>> visited;
            queue<pair<int, int>> q;
            q.push({start[0], start[1]});
            visited.insert({start[0], start[1]});
            int count = 0;

            while (!q.empty()) {
                auto [x, y] = q.front(); q.pop();
                if (x == end[0] && y == end[1]) return true;
                if (count > MAX) return true;

                for (auto& [dx, dy] : dirs) {
                    int nx = x + dx;
                    int ny = y + dy;
                    if (nx >= 0 && nx < 1000000 && ny >= 0 && ny < 1000000) {
                        auto key = make_pair(nx, ny);
                        if (!visited.count(key) && !blockedSet.count(key)) {
                            visited.insert(key);
                            q.push(key);
                        }
                    }
                }
                count++;
            }
            return false;
        };

        return bfs(source, target) && bfs(target, source);
    }
};
