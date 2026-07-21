function canConstruct(s: string, k: number): boolean {
  if (s.length < k) {
    return false;
  }

  const charCount: number[] = Array(26).fill(0);
  for (const c of s) {
    charCount[c.charCodeAt(0) - 97]++;
  }

  const oddCount = charCount.filter((freq) => freq % 2 !== 0).length;
  return oddCount <= k;
}
