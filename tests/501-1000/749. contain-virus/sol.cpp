#include <vector>
#include <stack>
#include <unordered_set>
#include <string>
#include <utility>

using namespace std;

class Solution {
public:
    int containVirus(vector<vector<int>>& isInfected) {
        int rows = isInfected.size();
        int cols = isInfected[0].size();
        vector<pair<int, int>> directions = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
        int totalWalls = 0;

        while (true) {
            vector<vector<bool>> seen(rows, vector<bool>(cols, false));
            vector<vector<pair<int, int>>> regions;
            vector<unordered_set<string>> frontiers;
            vector<int> wallsNeeded;

            for (int r = 0; r < rows; r++) {
                for (int c = 0; c < cols; c++) {
                    if (isInfected[r][c] != 1 || seen[r][c]) continue;
                    stack<pair<int, int>> stk;
                    stk.push({r, c});
                    seen[r][c] = true;
                    vector<pair<int, int>> region;
                    unordered_set<string> frontier;
                    int walls = 0;
                    while (!stk.empty()) {
                        auto [cr, cc] = stk.top();
                        stk.pop();
                        region.push_back({cr, cc});
                        for (auto& d : directions) {
                            int nr = cr + d.first;
                            int nc = cc + d.second;
                            if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) continue;
                            if (isInfected[nr][nc] == 1 && !seen[nr][nc]) {
                                seen[nr][nc] = true;
                                stk.push({nr, nc});
                            } else if (isInfected[nr][nc] == 0) {
                                walls++;
                                frontier.insert(to_string(nr) + "," + to_string(nc));
                            }
                        }
                    }
                    regions.push_back(region);
                    frontiers.push_back(frontier);
                    wallsNeeded.push_back(walls);
                }
            }

            if (regions.empty()) break;

            int target = 0;
            for (int i = 1; i < frontiers.size(); i++) {
                if (frontiers[i].size() > frontiers[target].size()) {
                    target = i;
                }
            }

            if (frontiers[target].empty()) break;

            totalWalls += wallsNeeded[target];

            for (auto& cell : regions[target]) {
                isInfected[cell.first][cell.second] = -1;
            }

            for (int i = 0; i < regions.size(); i++) {
                if (i == target) continue;
                for (const string& coord : frontiers[i]) {
                    size_t comma = coord.find(',');
                    int r = stoi(coord.substr(0, comma));
                    int c = stoi(coord.substr(comma + 1));
                    isInfected[r][c] = 1;
                }
            }
        }

        return totalWalls;
    }
};
