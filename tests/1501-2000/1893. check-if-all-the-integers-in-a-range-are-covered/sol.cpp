class Solution {
public:
    bool isCovered(vector<vector<int>>& ranges, int left, int right) {
        vector<int> slots(51, 0);
        for (auto& r : ranges) {
            int s = r[0], e = r[1];
            for (int i = s; i <= e; i++) {
                slots[i] = 1;
            }
        }
        for (int i = left; i <= right; i++) {
            if (slots[i] == 0) return false;
        }
        return true;
    }
};
