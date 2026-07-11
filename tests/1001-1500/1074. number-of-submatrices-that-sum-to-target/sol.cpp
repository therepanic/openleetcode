class Solution {
public:
    int numSubmatrixSumTarget(vector<vector<int>>& matrix, int target) {
        int m = matrix.size(), n = matrix[0].size();
        for (int row = 0; row < m; row++) {
            for (int col = 1; col < n; col++) {
                matrix[row][col] += matrix[row][col - 1];
            }
        }
        int count = 0;
        for (int c1 = 0; c1 < n; c1++) {
            for (int c2 = c1; c2 < n; c2++) {
                unordered_map<int, int> prefixSumMap;
                prefixSumMap[0] = 1;
                int sumVal = 0;
                for (int row = 0; row < m; row++) {
                    sumVal += matrix[row][c2] - (c1 > 0 ? matrix[row][c1 - 1] : 0);
                    count += prefixSumMap[sumVal - target];
                    prefixSumMap[sumVal]++;
                }
            }
        }
        return count;
    }
};
