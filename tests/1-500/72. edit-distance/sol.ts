function minDistance(word1: string, word2: string): number {
  const dp = new Array<number>(word2.length + 1);
  for (let j = 0; j <= word2.length; j++) {
    dp[j] = j;
  }

  for (let i = 1; i <= word1.length; i++) {
    let prev = dp[0];
    dp[0] = i;
    for (let j = 1; j <= word2.length; j++) {
      const temp = dp[j];
      if (word1[i - 1] === word2[j - 1]) {
        dp[j] = prev;
      } else {
        dp[j] = 1 + Math.min(prev, dp[j], dp[j - 1]);
      }
      prev = temp;
    }
  }

  return dp[word2.length];
}
