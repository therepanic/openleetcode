class Solution {
public:
    int leastBricks(vector<vector<int>>& wall) {
        unordered_map<int, int> edgeCounts;
        for (const auto& row : wall) {
            int edge = 0;
            for (int i = 0; i < row.size() - 1; i++) {
                edge += row[i];
                edgeCounts[edge]++;
            }
        }
        int maxEdges = 0;
        for (const auto& [_, count] : edgeCounts) {
            maxEdges = max(maxEdges, count);
        }
        return wall.size() - maxEdges;
    }
};
