class Solution {
public:
    double getMinDistSum(vector<vector<int>>& positions) {
        auto distSum = [&](double x, double y) {
            double sum = 0.0;
            for (auto& p : positions) {
                double dx = x - p[0];
                double dy = y - p[1];
                sum += sqrt(dx * dx + dy * dy);
            }
            return sum;
        };
        
        double x = 0.0, y = 0.0;
        for (auto& p : positions) {
            x += p[0];
            y += p[1];
        }
        x /= positions.size();
        y /= positions.size();
        
        double ans = distSum(x, y);
        double chg = 100.0;
        vector<pair<int, int>> dirs = {{-1, 0}, {0, -1}, {0, 1}, {1, 0}};
        
        while (chg > 1e-6) {
            bool zoom = true;
            for (auto& d : dirs) {
                double xx = x + chg * d.first;
                double yy = y + chg * d.second;
                double dd = distSum(xx, yy);
                if (dd < ans) {
                    ans = dd;
                    x = xx;
                    y = yy;
                    zoom = false;
                    break;
                }
            }
            if (zoom) chg /= 2;
        }
        return ans;
    }
};
