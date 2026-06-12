function wordBreak(s: string, wordDict: string[]): boolean {
  const words = new Set(wordDict);
  let maxLen = 0;
  for (const word of wordDict) maxLen = Math.max(maxLen, word.length);
  const dp = Array(s.length + 1).fill(false);
  dp[s.length] = true;
  for (let i = s.length - 1; i >= 0; i--) {
    for (let len = 1; len <= maxLen && i + len <= s.length; len++) {
      if (words.has(s.slice(i, i + len)) && dp[i + len]) {
        dp[i] = true;
        break;
      }
    }
  }
  return dp[0];
}
