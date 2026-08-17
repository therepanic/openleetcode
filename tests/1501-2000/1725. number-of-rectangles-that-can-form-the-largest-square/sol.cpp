class Solution {
public:
    int countGoodRectangles(vector<vector<int>>& rectangles) {
        int maxLen = 0;
        for (auto& rec : rectangles) {
            maxLen = max(maxLen, min(rec[0], rec[1]));
        }
        int count = 0;
        for (auto& rec : rectangles) {
            if (min(rec[0], rec[1]) == maxLen) {
                count++;
            }
        }
        return count;
    }
};
