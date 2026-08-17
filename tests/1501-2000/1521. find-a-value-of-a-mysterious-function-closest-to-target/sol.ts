function closestToTarget(arr: number[], target: number): number {
  const n = arr.length;
  const LOG = Math.floor(Math.log2(n)) + 1;
  const st: number[][] = Array.from({ length: n }, () =>
    new Array(LOG).fill(0),
  );
  for (let i = 0; i < n; i++) st[i][0] = arr[i];
  for (let j = 1; j < LOG; j++) {
    for (let i = 0; i + (1 << j) <= n; i++) {
      st[i][j] = st[i][j - 1] & st[i + (1 << (j - 1))][j - 1];
    }
  }
  const logs: number[] = new Array(n + 1).fill(0);
  for (let i = 2; i <= n; i++) logs[i] = logs[Math.floor(i / 2)] + 1;

  let res = Number.MAX_SAFE_INTEGER;
  for (let l = 0; l < n; l++) {
    let left = l,
      right = n - 1;
    while (left <= right) {
      const mid = Math.floor((left + right) / 2);
      const k = logs[mid - l + 1];
      const val = st[l][k] & st[mid - (1 << k) + 1][k];
      res = Math.min(res, Math.abs(val - target));
      if (val >= target) left = mid + 1;
      else right = mid - 1;
    }
  }
  return res;
}
