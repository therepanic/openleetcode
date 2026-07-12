class Solution {
public:
    double largestTriangleArea(vector<vector<int>>& points) {
        double max_area = 0.0;
        int n = points.size();
        for (int i = 0; i < n; i++) {
            int x1 = points[i][0], y1 = points[i][1];
            for (int j = i; j < n; j++) {
                int x2 = points[j][0], y2 = points[j][1];
                for (int k = j; k < n; k++) {
                    int x3 = points[k][0], y3 = points[k][1];
                    double area = abs(0.5 * (x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)));
                    if (area > max_area) {
                        max_area = area;
                    }
                }
            }
        }
        return max_area;
    }
};
