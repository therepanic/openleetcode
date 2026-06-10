
class Solution {
public:
    vector<int> getRow(int rowIndex) {
        vector<int> row = {1};
        for (int i = 0; i < rowIndex; ++i) {
            vector<int> next(row.size() + 1, 1);
            for (int j = 1; j < static_cast<int>(row.size()); ++j) {
                next[j] = row[j - 1] + row[j];
            }
            row.swap(next);
        }
        return row;
    }
};
