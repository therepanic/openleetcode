class Solution {
public:
    int largestOverlap(vector<vector<int>>& img1, vector<vector<int>>& img2) {
        int n = img1.size();
        vector<pair<int, int>> a, b;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (img1[i][j] == 1) a.push_back({i, j});
                if (img2[i][j] == 1) b.push_back({i, j});
            }
        }
        map<pair<int, int>, int> cnt;
        for (auto& p1 : a) {
            for (auto& p2 : b) {
                cnt[{p1.first - p2.first, p1.second - p2.second}]++;
            }
        }
        int max = 0;
        for (auto& [k, v] : cnt) {
            if (v > max) max = v;
        }
        return max;
    }
};
