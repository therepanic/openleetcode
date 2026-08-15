function checkPartitioning(s: string): boolean {
  const n = s.length;
  const pal: boolean[][] = Array.from({ length: n }, () =>
    new Array(n).fill(false),
  );
  for (let i = 0; i < n; i++) pal[i][i] = true;
  for (let length = 2; length <= n; length++) {
    for (let i = 0; i <= n - length; i++) {
      const j = i + length - 1;
      if (s[i] === s[j] && (length === 2 || pal[i + 1][j - 1])) {
        pal[i][j] = true;
      }
    }
  }
  for (let i = 0; i < n - 2; i++) {
    if (pal[0][i]) {
      for (let j = i + 1; j < n - 1; j++) {
        if (pal[i + 1][j] && pal[j + 1][n - 1]) return true;
      }
    }
  }
  return false;
}
