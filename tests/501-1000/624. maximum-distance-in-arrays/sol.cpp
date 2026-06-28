class Solution {
public:
    int maxDistance(vector<vector<int>>& arrays) {
        int smallest = arrays[0][0];
        int largest = arrays[0][arrays[0].size() - 1];
        int ans = 0;
        for (int i = 1; i < arrays.size(); i++) {
            int curMin = arrays[i][0];
            int curMax = arrays[i][arrays[i].size() - 1];
            ans = max({ans, largest - curMin, curMax - smallest});
            smallest = min(curMin, smallest);
            largest = max(curMax, largest);
        }
        return ans;
    }
};
