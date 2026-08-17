class Solution {
public:
    int maxWidthOfVerticalArea(vector<vector<int>>& points) {
        int maxWidth = 0;
        sort(points.begin(), points.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[0] < b[0];
        });
        for (int i = 0; i < points.size() - 1; i++) {
            int width = points[i+1][0] - points[i][0];
            maxWidth = max(maxWidth, width);
        }
        return maxWidth;
    }
};
