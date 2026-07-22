class Solution {
public:
    int removeCoveredIntervals(vector<vector<int>>& intervals) {
        sort(intervals.begin(), intervals.end(), [](const auto& a, const auto& b) {
            return a[0] == b[0] ? a[1] > b[1] : a[0] < b[0];
        });
        int res = 0, r = 0;
        for (const auto& interval : intervals) {
            if (interval[1] > r) {
                ++res;
            }
            r = max(r, interval[1]);
        }
        return res;
    }
};
