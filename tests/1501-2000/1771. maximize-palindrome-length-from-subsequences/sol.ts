function longestPalindrome(word1: string, word2: string): number {
  const word = word1 + word2;
  const n = word.length;
  const memo: number[][] = Array.from({ length: n }, () => Array(n).fill(-1));

  function fn(lo: number, hi: number): number {
    if (lo >= hi) return lo === hi ? 1 : 0;
    if (memo[lo][hi] !== -1) return memo[lo][hi];
    if (word[lo] === word[hi]) {
      memo[lo][hi] = 2 + fn(lo + 1, hi - 1);
    } else {
      memo[lo][hi] = Math.max(fn(lo + 1, hi), fn(lo, hi - 1));
    }
    return memo[lo][hi];
  }

  let ans = 0;
  const seen = new Set<string>();
  for (let i = 0; i < word1.length; i++) {
    const c = word1[i];
    if (seen.has(c)) continue;
    seen.add(c);
    const idx1 = word1.indexOf(c);
    const idx2 = word2.lastIndexOf(c);
    if (idx1 !== -1 && idx2 !== -1) {
      ans = Math.max(ans, fn(idx1, idx2 + word1.length));
    }
  }
  return ans;
}
