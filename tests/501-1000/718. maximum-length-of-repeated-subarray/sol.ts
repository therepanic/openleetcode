function findLength(nums1: number[], nums2: number[]): number {
  const m = nums1.length;
  const n = nums2.length;
  const dp = new Array<number>(n + 1).fill(0);
  let answer = 0;

  for (let i = 1; i <= m; i++) {
    for (let j = n; j >= 1; j--) {
      if (nums1[i - 1] === nums2[j - 1]) {
        dp[j] = dp[j - 1] + 1;
        if (dp[j] > answer) {
          answer = dp[j];
        }
      } else {
        dp[j] = 0;
      }
    }
  }

  return answer;
}
