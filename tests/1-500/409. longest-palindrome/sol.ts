function longestPalindrome(s: string): number {
  const count: Map<string, number> = new Map();
  for (const c of s) {
    count.set(c, (count.get(c) || 0) + 1);
  }

  let maxLen = 0;
  let odd = false;

  for (const freq of count.values()) {
    if (freq % 2 === 0) {
      maxLen += freq;
    } else {
      maxLen += freq - 1;
      odd = true;
    }
  }

  return maxLen + (odd ? 1 : 0);
}
