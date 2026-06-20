class Solution {
public:
    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        bool v = false;
        for (auto& i : matrix) {
            for (int j = 0; j < i.size(); j++) {
                if (i[j] == target) {
                    v = true;
                }
            }
        }
        return v;
    }
};
