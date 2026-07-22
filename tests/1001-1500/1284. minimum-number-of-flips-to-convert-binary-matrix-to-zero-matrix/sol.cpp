#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    int minFlips(vector<vector<int>>& mat) {
        int m = (int)mat.size();
        int n = (int)mat[0].size();
        vector<int> masks;
        masks.reserve(m * n);
        static const int dirs[5][2] = {
            {0, 0},
            {1, 0},
            {-1, 0},
            {0, 1},
            {0, -1},
        };

        for (int r = 0; r < m; ++r) {
            for (int c = 0; c < n; ++c) {
                int mask = 0;
                for (const auto& d : dirs) {
                    int dr = d[0];
                    int dc = d[1];
                    int nr = r + dr, nc = c + dc;
                    if (0 <= nr && nr < m && 0 <= nc && nc < n) {
                        mask |= 1 << (nr * n + nc);
                    }
                }
                masks.push_back(mask);
            }
        }

        int start = 0;
        for (int r = 0; r < m; ++r) {
            for (int c = 0; c < n; ++c) {
                if (mat[r][c]) {
                    start |= 1 << (r * n + c);
                }
            }
        }

        queue<pair<int, int>> q;
        vector<int> dist(1 << (m * n), -1);
        dist[start] = 0;
        q.push({start, 0});

        while (!q.empty()) {
            auto [state, steps] = q.front();
            q.pop();
            if (state == 0) {
                return steps;
            }
            for (int mask : masks) {
                int next = state ^ mask;
                if (dist[next] == -1) {
                    dist[next] = steps + 1;
                    q.push({next, steps + 1});
                }
            }
        }

        return -1;
    }
};
