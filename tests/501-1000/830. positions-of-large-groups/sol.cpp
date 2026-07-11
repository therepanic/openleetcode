class Solution {
public:
    vector<vector<int>> largeGroupPositions(string s) {
        vector<vector<int>> intervals;
        int left = 0;
        while (left < s.size()) {
            int start = left;
            while (left + 1 < s.size() && s[left + 1] == s[left]) {
                left++;
            }
            if (left - start >= 2) {
                intervals.push_back({start, left});
            }
            left++;
        }
        return intervals;
    }
};
