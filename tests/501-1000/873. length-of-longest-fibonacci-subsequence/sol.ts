function lenLongestFibSubseq(arr: number[]): number {
  const n = arr.length;
  const dp: number[][] = Array.from({ length: n }, () => Array(n).fill(0));
  let maxLen = 0;

  for (let curr = 2; curr < n; curr++) {
    let start = 0;
    let end = curr - 1;

    while (start < end) {
      const pairSum = arr[start] + arr[end];

      if (pairSum > arr[curr]) {
        end--;
      } else if (pairSum < arr[curr]) {
        start++;
      } else {
        dp[end][curr] = dp[start][end] + 1;
        maxLen = Math.max(dp[end][curr], maxLen);
        end--;
        start++;
      }
    }
  }

  return maxLen > 0 ? maxLen + 2 : 0;
}
