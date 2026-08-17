#include <vector>
#include <algorithm>
#include <cmath>

class Solution {
public:
    int visiblePoints(vector<vector<int>>& points, int angle, vector<int>& location) {
        vector<double> angles;
        int same = 0;
        int x0 = location[0], y0 = location[1];
        
        for (auto& p : points) {
            int dx = p[0] - x0;
            int dy = p[1] - y0;
            if (dx == 0 && dy == 0) {
                same++;
                continue;
            }
            double ang = atan2(dy, dx) * 180.0 / M_PI;
            angles.push_back(ang);
        }
        
        if (angles.empty()) return same;
        
        sort(angles.begin(), angles.end());
        int n = angles.size();
        vector<double> full = angles;
        for (double a : angles) full.push_back(a + 360);
        
        int maxVis = 0;
        int j = 0;
        for (int i = 0; i < n; i++) {
            while (j < full.size() && full[j] - full[i] <= angle) {
                j++;
            }
            maxVis = max(maxVis, j - i);
        }
        
        return maxVis + same;
    }
};
