function countSubstrings(s: string, t: string): number {
  const m = s.length,
    n = t.length;
  let result = 0;

  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      let diff = 0;
      let k = 0;
      while (i + k < m && j + k < n) {
        if (s[i + k] !== t[j + k]) {
          diff++;
        }
        if (diff > 1) {
          break;
        }
        if (diff === 1) {
          result++;
        }
        k++;
      }
    }
  }

  return result;
}
