class Solution {
public:
    vector<vector<char>> rotateTheBox(vector<vector<char>>& boxGrid) {
        auto& box = boxGrid;
        int r = box.size(), c = box[0].size();
        vector<vector<char>> rotate(c, vector<char>(r, '.'));
        for (int i = 0; i < r; ++i) {
            int bottom = c - 1;
            for (int j = c - 1; j >= 0; --j) {
                if (box[i][j] == '#') {
                    rotate[bottom][r - 1 - i] = '#';
                    bottom--;
                } else if (box[i][j] == '*') {
                    rotate[j][r - 1 - i] = '*';
                    bottom = j - 1;
                }
            }
        }
        return rotate;
    }
};
