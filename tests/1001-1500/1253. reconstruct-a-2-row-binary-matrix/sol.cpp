class Solution {
public:
    vector<vector<int>> reconstructMatrix(int upper, int lower, vector<int>& colsum) {
        int sum = 0;
        for (int c : colsum) sum += c;
        if (upper + lower != sum) return {};
        
        int n = colsum.size();
        vector<int> row1(n, 0), row2(n, 0);
        
        for (int i = 0; i < n; i++) {
            if (colsum[i] == 2) {
                row1[i] = 1;
                row2[i] = 1;
                upper--;
                lower--;
            } else if (colsum[i] == 1) {
                if (upper > lower) {
                    row1[i] = 1;
                    upper--;
                } else {
                    row2[i] = 1;
                    lower--;
                }
            }
        }
        
        if (lower == 0 && upper == 0) return {row1, row2};
        return {};
    }
};
