function maxSideLength(mat: number[][], threshold: number): number {
  const n = mat.length;
  const m = mat[0].length;
  const pref: number[][] = mat.map((row) => [...row]);
  for (let i = 0; i < n; i++) {
    for (let j = 1; j < m; j++) {
      pref[i][j] += pref[i][j - 1];
    }
  }
  for (let j = 0; j < m; j++) {
    for (let i = 1; i < n; i++) {
      pref[i][j] += pref[i - 1][j];
    }
  }
  const isValid = (k: number): boolean => {
    for (let i = k - 1; i < n; i++) {
      for (let j = k - 1; j < m; j++) {
        const x1 = i - k + 1;
        const y1 = j - k + 1;
        let total = pref[i][j];
        if (x1 > 0) total -= pref[x1 - 1][j];
        if (y1 > 0) total -= pref[i][y1 - 1];
        if (x1 > 0 && y1 > 0) total += pref[x1 - 1][y1 - 1];
        if (total <= threshold) return true;
      }
    }
    return false;
  };
  let low = 1,
    high = Math.min(n, m);
  let ans = 0;
  while (low <= high) {
    const mid = Math.floor((low + high) / 2);
    if (isValid(mid)) {
      ans = mid;
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return ans;
}
