class Solution {
public:
    int regionsBySlashes(vector<string>& grid) {
        int n = grid.size();
        vector<int> parents(4 * n * n);
        for (int i = 0; i < 4 * n * n; i++) {
            parents[i] = i;
        }
        int count = 4 * n * n;

        function<int(int)> find = [&](int x) -> int {
            if (x != parents[x]) {
                parents[x] = find(parents[x]);
            }
            return parents[x];
        };

        auto unionSet = [&](int x, int y) -> bool {
            int rx = find(x);
            int ry = find(y);
            if (rx != ry) {
                parents[rx] = ry;
                return true;
            }
            return false;
        };

        vector<vector<pair<int, int>>> merges = {
            {{0, 1}, {1, 2}, {2, 3}}, // ' '
            {{0, 3}, {1, 2}},         // '/'
            {{0, 1}, {2, 3}}          // '\\'
        };

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                int base = (i * n + j) * 4;
                int idx;
                if (grid[i][j] == ' ') idx = 0;
                else if (grid[i][j] == '/') idx = 1;
                else idx = 2;

                for (auto& p : merges[idx]) {
                    int u = p.first, v = p.second;
                    if (unionSet(base + u, base + v)) {
                        count--;
                    }
                }

                if (i + 1 < n) {
                    int downBase = ((i + 1) * n + j) * 4;
                    if (unionSet(base + 2, downBase)) {
                        count--;
                    }
                }

                if (j + 1 < n) {
                    int rightBase = (i * n + (j + 1)) * 4;
                    if (unionSet(base + 1, rightBase + 3)) {
                        count--;
                    }
                }
            }
        }
        return count;
    }
};
