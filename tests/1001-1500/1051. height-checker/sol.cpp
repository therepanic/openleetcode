class Solution {
public:
    int heightChecker(vector<int>& heights) {
        int count = 0;
        vector<int> s = heights;
        sort(s.begin(), s.end());
        for (int i = 0; i < heights.size(); i++) {
            if (heights[i] != s[i]) {
                count++;
            }
        }
        return count;
    }
};
