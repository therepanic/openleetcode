function minHeightShelves(books: number[][], shelfWidth: number): number {
  const n = books.length;
  const dp: number[] = new Array(n + 1).fill(Number.POSITIVE_INFINITY);
  dp[0] = 0;

  for (let i = 1; i <= n; i++) {
    dp[i] = dp[i - 1] + books[i - 1][1];
    let height = 0;
    let width = 0;
    for (let j = i - 1; j >= 0; j--) {
      height = Math.max(height, books[j][1]);
      width += books[j][0];
      if (width > shelfWidth) {
        break;
      }
      dp[i] = Math.min(dp[i], dp[j] + height);
    }
  }

  return dp[n];
}
