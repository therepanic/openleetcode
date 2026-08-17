class Solution {
public:
    int maximumPopulation(vector<vector<int>>& logs) {
        int l = logs.size();
        vector<int> a;
        int r = 0;
        int y = 0;
        for (auto& i : logs) {
            a.push_back(i[0]);
        }
        for (int j = 0; j < l; j++) {
            int c = 0;
            for (int k = 0; k < l; k++) {
                if (a[j] >= logs[k][0] && a[j] < logs[k][1] && j != k) {
                    c++;
                }
            }
            if (c > r) {
                r = c;
                y = a[j];
            }
            if (c == r && r > 0) {
                if (a[j] < y) {
                    y = a[j];
                }
            }
        }
        if (y == 0) {
            return *min_element(a.begin(), a.end());
        }
        return y;
    }
};
