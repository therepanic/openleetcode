class Solution {
  int maxScore(List<int> cardPoints, int k) {
    int l = 0;
    int n = cardPoints.length;
    int total = cardPoints.sublist(n - k).fold(0, (a, b) => a + b);
    int res = total;
    for (int r = n - k; r < n; r++) {
      total += cardPoints[l] - cardPoints[r];
      if (total > res) res = total;
      l++;
    }
    return res;
  }
}
