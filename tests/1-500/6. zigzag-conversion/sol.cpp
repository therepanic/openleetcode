class Solution {
public:
    string convert(string s, int numRows) {
        if (numRows == 1 || numRows >= (int)s.size()) {
            return s;
        }

        vector<string> rows(numRows);
        int idx = 0;
        int step = 1;

        for (char c : s) {
            rows[idx].push_back(c);
            if (idx == 0) {
                step = 1;
            } else if (idx == numRows - 1) {
                step = -1;
            }
            idx += step;
        }

        string result;
        for (const string& row : rows) {
            result += row;
        }
        return result;
    }
};
