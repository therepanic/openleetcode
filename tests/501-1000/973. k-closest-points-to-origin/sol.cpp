#include <vector>
#include <algorithm>
using namespace std;

class Solution {
public:
    vector<vector<int>> kClosest(vector<vector<int>>& points, int k) {
        sort(points.begin(), points.end(), [](const vector<int>& a, const vector<int>& b) {
            long long da = 1LL * a[0] * a[0] + 1LL * a[1] * a[1];
            long long db = 1LL * b[0] * b[0] + 1LL * b[1] * b[1];
            return da < db;
        });
        return vector<vector<int>>(points.begin(), points.begin() + k);
    }
};
