class Solution {
public:
    int hIndex(vector<int>& citations) {
        int n = citations.size();
        int l = 0, r = n;
        while (l < r) {
            int m = (l + r + 1) / 2;
            if (citations[n - m] >= m) {
                l = m;
            } else {
                r = m - 1;
            }
        }
        return l;
    }
};
