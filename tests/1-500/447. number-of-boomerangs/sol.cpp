class Solution {
public:
    int numberOfBoomerangs(vector<vector<int>>& points) {
        int result = 0;
        for (auto& p : points) {
            unordered_map<int, int> distances;
            for (auto& q : points) {
                int d = (p[0] - q[0]) * (p[0] - q[0]) + (p[1] - q[1]) * (p[1] - q[1]);
                distances[d]++;
            }
            for (auto& [key, count] : distances) {
                result += count * (count - 1);
            }
        }
        return result;
    }
};
