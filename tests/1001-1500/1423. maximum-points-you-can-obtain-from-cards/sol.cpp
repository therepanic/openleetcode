class Solution {
public:
    int maxScore(vector<int>& cardPoints, int k) {
        int l = 0;
        int n = cardPoints.size();
        int total = 0;
        for (int i = n - k; i < n; i++) {
            total += cardPoints[i];
        }
        int res = total;
        for (int r = n - k; r < n; r++) {
            total += cardPoints[l] - cardPoints[r];
            res = max(res, total);
            l++;
        }
        return res;
    }
};
