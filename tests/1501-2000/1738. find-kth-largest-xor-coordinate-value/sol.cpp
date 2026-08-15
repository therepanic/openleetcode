class Solution {
public:
    int kthLargestValue(vector<vector<int>>& matrix, int k) {
        int n = matrix.size();
        int m = matrix[0].size();
        vector<vector<int>> temp(n, vector<int>(m));
        temp[0][0] = matrix[0][0];
        for (int j = 1; j < m; j++) temp[0][j] = temp[0][j-1] ^ matrix[0][j];
        for (int i = 1; i < n; i++) temp[i][0] = temp[i-1][0] ^ matrix[i][0];
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                temp[i][j] = matrix[i][j] ^ temp[i-1][j] ^ temp[i][j-1] ^ temp[i-1][j-1];
            }
        }
        vector<int> arr;
        arr.reserve(n*m);
        for (auto& row : temp) {
            arr.insert(arr.end(), row.begin(), row.end());
        }
        sort(arr.begin(), arr.end(), greater<int>());
        return arr[k-1];
    }
};
