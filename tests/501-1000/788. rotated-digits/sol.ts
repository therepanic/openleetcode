function rotatedDigits(n: number): number {
  const dp: number[] = new Array(n + 1).fill(0);
  let count = 0;

  for (let i = 0; i <= n; i++) {
    if (i < 10) {
      if (i === 0 || i === 1 || i === 8) {
        dp[i] = 1;
      } else if (i === 2 || i === 5 || i === 6 || i === 9) {
        dp[i] = 2;
        count++;
      } else {
        dp[i] = 0;
      }
    } else {
      const a = dp[Math.floor(i / 10)];
      const b = dp[i % 10];

      if (a === 1 && b === 1) {
        dp[i] = 1;
      } else if (a >= 1 && b >= 1) {
        dp[i] = 2;
        count++;
      } else {
        dp[i] = 0;
      }
    }
  }

  return count;
}
