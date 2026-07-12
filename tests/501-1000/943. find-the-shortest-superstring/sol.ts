function shortestSuperstring(words: string[]): string {
  const n: number = words.length;
  const overlap: number[][] = Array.from({ length: n }, () => Array(n).fill(0));

  function getOverlap(a: string, b: string): number {
    let maxOlap = 0;
    for (let k = 1; k <= Math.min(a.length, b.length); k++) {
      if (a.substring(a.length - k) === b.substring(0, k)) {
        maxOlap = Math.max(maxOlap, k);
      }
    }
    return maxOlap;
  }

  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      if (i !== j) {
        overlap[i][j] = getOverlap(words[i], words[j]);
      }
    }
  }

  const dp: string[][] = Array.from({ length: 1 << n }, () =>
    Array(n).fill(""),
  );
  for (let i = 0; i < n; i++) {
    dp[1 << i][i] = words[i];
  }

  for (let mask = 0; mask < 1 << n; mask++) {
    for (let u = 0; u < n; u++) {
      if (!(mask & (1 << u))) continue;
      for (let v = 0; v < n; v++) {
        if (mask & (1 << v)) continue;
        const newMask = mask | (1 << v);
        const candidate = dp[mask][u] + words[v].substring(overlap[u][v]);
        if (dp[newMask][v] === "" || candidate.length < dp[newMask][v].length) {
          dp[newMask][v] = candidate;
        }
      }
    }
  }

  let shortest = "";
  for (const candidate of dp[(1 << n) - 1]) {
    if (shortest === "" || candidate.length < shortest.length) {
      shortest = candidate;
    }
  }
  return shortest;
}
