class Solution {
public:
    vector<vector<int>> generateMatrix(int n) {
        vector<vector<int>> res(n, vector<int>(n, 0));
        int top = 0;
        int bottom = n - 1;
        int left = 0;
        int right = n - 1;
        int val = 1;

        while (top <= bottom && left <= right) {
            for (int col = left; col <= right; col++) {
                res[top][col] = val++;
            }
            top++;

            for (int row = top; row <= bottom; row++) {
                res[row][right] = val++;
            }
            right--;

            if (top <= bottom) {
                for (int col = right; col >= left; col--) {
                    res[bottom][col] = val++;
                }
                bottom--;
            }

            if (left <= right) {
                for (int row = bottom; row >= top; row--) {
                    res[row][left] = val++;
                }
                left++;
            }
        }

        return res;
    }
};
