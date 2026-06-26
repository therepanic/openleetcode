function findRotateSteps(ring: string, key: string): number {
  function dist(size: number, p: number, t: number): number {
    const diff = Math.abs(t - p);
    return Math.min(diff, size - diff);
  }

  const mp: number[][] = Array.from({ length: 26 }, () => Array(100).fill(0));
  const freq: number[] = Array(26).fill(0);
  const dp: number[][] = Array.from({ length: 100 }, () => Array(100).fill(0));

  const n = ring.length;
  const m = key.length;

  for (let i = 0; i < n; i++) {
    const idx = ring.charCodeAt(i) - "a".charCodeAt(0);
    mp[idx][freq[idx]] = i;
    freq[idx]++;
  }

  const firstChar = key.charCodeAt(0) - "a".charCodeAt(0);
  for (let i = 0; i < freq[firstChar]; i++) {
    dp[0][mp[firstChar][i]] = dist(n, 0, mp[firstChar][i]) + 1;
  }

  for (let i = 1; i < m; i++) {
    const prevChar = key.charCodeAt(i - 1) - "a".charCodeAt(0);
    const currChar = key.charCodeAt(i) - "a".charCodeAt(0);
    for (let j = 0; j < freq[currChar]; j++) {
      let mini = Infinity;
      for (let k = 0; k < freq[prevChar]; k++) {
        mini = Math.min(
          mini,
          dp[i - 1][mp[prevChar][k]] +
            dist(n, mp[currChar][j], mp[prevChar][k]) +
            1,
        );
      }
      dp[i][mp[currChar][j]] = mini;
    }
  }

  const lastChar = key.charCodeAt(m - 1) - "a".charCodeAt(0);
  let res = Infinity;
  for (let i = 0; i < freq[lastChar]; i++) {
    res = Math.min(res, dp[m - 1][mp[lastChar][i]]);
  }

  return res;
}
