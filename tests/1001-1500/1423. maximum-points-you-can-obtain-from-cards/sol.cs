public class Solution {
    public int MaxScore(int[] cardPoints, int k) {
        int l = 0;
        int n = cardPoints.Length;
        int total = cardPoints[(n - k)..].Sum();
        int res = total;
        for (int r = n - k; r < n; r++) {
            total += cardPoints[l] - cardPoints[r];
            res = Math.Max(res, total);
            l++;
        }
        return res;
    }
}
