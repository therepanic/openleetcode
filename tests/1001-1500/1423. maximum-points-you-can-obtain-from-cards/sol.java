class Solution {
    public int maxScore(int[] cardPoints, int k) {
        int l = 0;
        int total = 0;
        int n = cardPoints.length;
        for (int i = n - k; i < n; i++) {
            total += cardPoints[i];
        }
        int res = total;
        for (int r = n - k; r < n; r++) {
            total += cardPoints[l] - cardPoints[r];
            res = Math.max(res, total);
            l++;
        }
        return res;
    }
}
