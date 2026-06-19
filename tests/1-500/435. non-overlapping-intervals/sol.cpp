class Solution {
public:
    int eraseOverlapIntervals(vector<vector<int>>& intervals) {
        if (intervals.empty()) return 0;
        sort(intervals.begin(), intervals.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[1] < b[1];
        });
        int count = 0;
        int end = intervals[0][1];
        for (int i = 1; i < intervals.size(); i++) {
            if (end > intervals[i][0]) {
                count++;
            } else {
                end = intervals[i][1];
            }
        }
        return count;
    }
};
