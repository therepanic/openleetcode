function maxDotProduct(nums1: number[], nums2: number[]): number {
  const memo: number[][] = Array.from({ length: nums1.length }, () =>
    Array(nums2.length).fill(-Infinity),
  );

  function dp(i: number, j: number): number {
    if (i === nums1.length || j === nums2.length) {
      return -Infinity;
    }
    if (memo[i][j] !== -Infinity) {
      return memo[i][j];
    }

    const take = nums1[i] * nums2[j];
    let res = take;
    const takeAndContinue = dp(i + 1, j + 1);
    if (takeAndContinue !== -Infinity) {
      res = Math.max(res, take + takeAndContinue);
    }
    res = Math.max(res, dp(i + 1, j));
    res = Math.max(res, dp(i, j + 1));

    memo[i][j] = res;
    return res;
  }

  return dp(0, 0);
}
