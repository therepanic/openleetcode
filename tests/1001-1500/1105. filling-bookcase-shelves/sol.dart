class Solution {
  int minHeightShelves(List<List<int>> books, int shelfWidth) {
    int n = books.length;
    const int inf = 1 << 30;
    List<int> dp = List.filled(n + 1, inf);
    dp[0] = 0;
    
    for (int i = 1; i <= n; i++) {
      dp[i] = dp[i - 1] + books[i - 1][1];
      int height = 0;
      int width = 0;
      for (int j = i - 1; j >= 0; j--) {
        height = height > books[j][1] ? height : books[j][1];
        width += books[j][0];
        if (width > shelfWidth) {
          break;
        }
        dp[i] = dp[i] < dp[j] + height ? dp[i] : dp[j] + height;
      }
    }
    
    return dp[n];
  }
}
