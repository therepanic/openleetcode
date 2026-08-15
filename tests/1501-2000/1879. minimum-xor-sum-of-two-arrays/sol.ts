function minimumXORSum(nums1: number[], nums2: number[]): number {
  const n = nums1.length;
  const fullMask = 1 << n;
  const dp = new Array(fullMask).fill(2147483647);
  dp[0] = 0;
  for (let mask = 0; mask < fullMask; mask++) {
    let idx = 0;
    let temp = mask;
    while (temp > 0) {
      idx += temp & 1;
      temp >>= 1;
    }
    if (idx >= n) continue;
    for (let j = 0; j < n; j++) {
      if ((mask & (1 << j)) === 0) {
        const nextMask = mask | (1 << j);
        const cost = dp[mask] + (nums1[idx] ^ nums2[j]);
        if (cost < dp[nextMask]) {
          dp[nextMask] = cost;
        }
      }
    }
  }
  return dp[fullMask - 1];
}
