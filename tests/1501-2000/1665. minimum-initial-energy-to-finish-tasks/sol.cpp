class Solution {
public:
    int minimumEffort(vector<vector<int>>& tasks) {
        sort(tasks.begin(), tasks.end(), [](const vector<int>& a, const vector<int>& b) {
            return (a[1] - a[0]) > (b[1] - b[0]);
        });
        auto test = [&](int bal) {
            for (auto& t : tasks) {
                if (bal < t[1]) return false;
                bal -= t[0];
            }
            return true;
        };
        int lo = 0, hi = 1000000001;
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (test(mid)) hi = mid;
            else lo = mid + 1;
        }
        return lo;
    }
};
