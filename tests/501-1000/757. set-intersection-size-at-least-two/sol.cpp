class Solution {
public:
    int intersectionSizeTwo(vector<vector<int>>& intervals) {
        sort(intervals.begin(), intervals.end(), [](const vector<int>& x, const vector<int>& y) {
            if (x[1] != y[1]) return x[1] < y[1];
            return x[0] > y[0];
        });
        int ans = 0;
        int a = -1, b = -1;
        for (const auto& interval : intervals) {
            int l = interval[0], r = interval[1];
            if (l > b) {
                a = r - 1;
                b = r;
                ans += 2;
            } else if (l > a) {
                a = b;
                b = r;
                ans += 1;
            }
        }
        return ans;
    }
};
