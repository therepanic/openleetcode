class Solution {
public:
    bool validSquare(vector<int>& p1, vector<int>& p2, vector<int>& p3, vector<int>& p4) {
        auto getDistSq = [](vector<int>& pt1, vector<int>& pt2) {
            return (pt1[0] - pt2[0]) * (pt1[0] - pt2[0]) + 
                   (pt1[1] - pt2[1]) * (pt1[1] - pt2[1]);
        };
        
        vector<vector<int>> points = {p1, p2, p3, p4};
        unordered_set<int> distances;
        
        for (int i = 0; i < 4; i++) {
            for (int j = i + 1; j < 4; j++) {
                distances.insert(getDistSq(points[i], points[j]));
            }
        }
        
        return distances.size() == 2 && distances.find(0) == distances.end();
    }
};
