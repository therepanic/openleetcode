class Solution {
public:
    vector<int> findRightInterval(vector<vector<int>>& intervals) {
        int n = intervals.size();
        vector<pair<int, int>> starts(n);
        for (int i = 0; i < n; i++) {
            starts[i] = {intervals[i][0], i};
        }
        sort(starts.begin(), starts.end());
        vector<int> res;
        for (auto& interval : intervals) {
            int end = interval[1];
            int left = 0, right = n - 1;
            int idx = -1;
            while (left <= right) {
                int mid = (left + right) / 2;
                if (starts[mid].first >= end) {
                    idx = starts[mid].second;
                    right = mid - 1;
                } else {
                    left = mid + 1;
                }
            }
            res.push_back(idx);
        }
        return res;
    }
};
