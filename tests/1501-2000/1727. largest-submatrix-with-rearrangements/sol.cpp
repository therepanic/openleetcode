class Solution {
public:
    int largestSubmatrix(vector<vector<int>>& matrix) {
        int m = matrix.size();
        int n = matrix[0].size();
        int maxArea = 0;
        vector<int> h(n, 0);
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (j < matrix[i].size() && matrix[i][j] == 1) {
                    h[j]++;
                } else {
                    h[j] = 0;
                }
            }
            vector<int> count(m + 1, 0);
            for (int height : h) count[height]++;
            int width = 0;
            for (int height = m; height > 0; height--) {
                while (count[height]-- > 0) {
                    width++;
                    maxArea = max(maxArea, height * width);
                }
            }
        }
        return maxArea;
    }
};
