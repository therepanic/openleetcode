function findSubstringInWraproundString(s: string): number {
  const counts: number[] = new Array(26).fill(0);
  let maxLen = 0;

  for (let i = 0; i < s.length; i++) {
    if (i > 0 && (s.charCodeAt(i) - s.charCodeAt(i - 1) + 26) % 26 === 1) {
      maxLen++;
    } else {
      maxLen = 1;
    }
    const idx = s.charCodeAt(i) - "a".charCodeAt(0);
    if (counts[idx] < maxLen) {
      counts[idx] = maxLen;
    }
  }

  return counts.reduce((sum, cur) => sum + cur, 0);
}
