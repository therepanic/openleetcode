class Solution {
public:
    vector<int> countPoints(vector<vector<int>>& points, vector<vector<int>>& queries) {
        vector<int> result(queries.size(), 0);
        for (int i = 0; i < queries.size(); i++) {
            for (int j = 0; j < points.size(); j++) {
                int dx = queries[i][0] - points[j][0];
                int dy = queries[i][1] - points[j][1];
                if (dx * dx + dy * dy <= queries[i][2] * queries[i][2]) {
                    result[i]++;
                }
            }
        }
        return result;
    }
};
