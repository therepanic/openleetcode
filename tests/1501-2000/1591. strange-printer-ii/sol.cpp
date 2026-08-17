#include <vector>
#include <unordered_map>
#include <unordered_set>
#include <algorithm>
using namespace std;

class Solution {
public:
    bool isPrintable(vector<vector<int>>& targetGrid) {
        int m = targetGrid.size(), n = targetGrid[0].size();
        unordered_map<int, vector<pair<int, int>>> colors;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                colors[targetGrid[i][j]].push_back({i, j});
            }
        }
        
        auto canRemove = [&](int color) -> bool {
            auto& pos = colors[color];
            int mnR = pos[0].first, mxR = pos[0].first;
            int mnC = pos[0].second, mxC = pos[0].second;
            for (auto& p : pos) {
                mnR = min(mnR, p.first);
                mxR = max(mxR, p.first);
                mnC = min(mnC, p.second);
                mxC = max(mxC, p.second);
            }
            for (int i = mnR; i <= mxR; i++) {
                for (int j = mnC; j <= mxC; j++) {
                    if (targetGrid[i][j] != color && targetGrid[i][j] > 0) return false;
                }
            }
            for (int i = mnR; i <= mxR; i++) {
                for (int j = mnC; j <= mxC; j++) {
                    targetGrid[i][j] = 0;
                }
            }
            return true;
        };
        
        unordered_set<int> colorSet;
        for (auto& kv : colors) colorSet.insert(kv.first);
        while (!colorSet.empty()) {
            unordered_set<int> removable;
            for (int c : colorSet) {
                if (canRemove(c)) removable.insert(c);
            }
            if (removable.empty()) return false;
            for (int c : removable) colorSet.erase(c);
        }
        return true;
    }
};
