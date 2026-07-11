class Solution {
public:
    int minAreaRect(vector<vector<int>>& points) {
        map<int, vector<int>> cols;
        for (auto& point : points) {
            int x = point[0], y = point[1];
            cols[x].push_back(y);
        }
        
        map<pair<int, int>, int> lastX;
        int best = INT_MAX;
        
        for (auto& [x, ys] : cols) {
            sort(ys.begin(), ys.end());
            for (size_t i = 0; i < ys.size(); i++) {
                for (size_t j = i + 1; j < ys.size(); j++) {
                    pair<int, int> p = {ys[i], ys[j]};
                    if (lastX.count(p)) {
                        int area = (x - lastX[p]) * (ys[j] - ys[i]);
                        best = min(best, area);
                    }
                    lastX[p] = x;
                }
            }
        }
        return best == INT_MAX ? 0 : best;
    }
};
