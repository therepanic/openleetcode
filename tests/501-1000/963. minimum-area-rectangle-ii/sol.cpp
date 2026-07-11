class Solution {
public:
    double minAreaFreeRect(vector<vector<int>>& points) {
        double ans = numeric_limits<double>::infinity();
        map<tuple<double, double, long long>, vector<pair<int, int>>> seen;
        int n = points.size();
        for (int i = 0; i < n; ++i) {
            int x0 = points[i][0], y0 = points[i][1];
            for (int j = i + 1; j < n; ++j) {
                int x1 = points[j][0], y1 = points[j][1];
                double cx = (x0 + x1) / 2.0;
                double cy = (y0 + y1) / 2.0;
                long long d2 = (long long)(x0 - x1) * (x0 - x1) + (long long)(y0 - y1) * (y0 - y1);
                auto key = make_tuple(cx, cy, d2);
                if (seen.count(key)) {
                    for (auto& [xx, yy] : seen[key]) {
                        double area = sqrt(((double)(x0 - xx) * (x0 - xx) + (double)(y0 - yy) * (y0 - yy)) *
                                           ((double)(x1 - xx) * (x1 - xx) + (double)(y1 - yy) * (y1 - yy)));
                        ans = min(ans, area);
                    }
                }
                seen[key].emplace_back(x0, y0);
            }
        }
        return isinf(ans) ? 0.0 : ans;
    }
};
