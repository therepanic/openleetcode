function maxSumSubmatrix(matrix: number[][], k: number): number {
  const m = matrix.length;
  const n = matrix[0].length;
  let ans = -Infinity;
  for (let left = 0; left < n; left++) {
    const rowSum = new Array(m).fill(0);
    for (let right = left; right < n; right++) {
      for (let i = 0; i < m; i++) {
        rowSum[i] += matrix[i][right];
      }
      const s: number[] = [0];
      let curr = 0;
      for (const x of rowSum) {
        curr += x;
        const target = curr - k;
        let lo = 0,
          hi = s.length;
        while (lo < hi) {
          const mid = (lo + hi) >> 1;
          if (s[mid] < target) {
            lo = mid + 1;
          } else {
            hi = mid;
          }
        }
        if (lo < s.length) {
          ans = Math.max(ans, curr - s[lo]);
        }
        lo = 0;
        hi = s.length;
        while (lo < hi) {
          const mid = (lo + hi) >> 1;
          if (s[mid] < curr) {
            lo = mid + 1;
          } else {
            hi = mid;
          }
        }
        s.splice(lo, 0, curr);
      }
    }
  }
  return ans;
}
