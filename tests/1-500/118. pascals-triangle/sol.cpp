
class Solution {
public:
    vector<vector<int>> generate(int numRows) {
        vector<vector<int>> result;
        for (int i = 0; i < numRows; ++i) {
            vector<int> row(i + 1, 1);
            for (int j = 1; j < i; ++j) {
                row[j] = result.back()[j - 1] + result.back()[j];
            }
            result.push_back(row);
        }
        return result;
    }
};
