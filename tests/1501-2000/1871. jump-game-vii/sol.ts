function canReach(s: string, minJump: number, maxJump: number): boolean {
  const n = s.length;
  if (s[n - 1] === "1") return false;

  const dp: boolean[] = new Array(n).fill(false);
  dp[0] = true;

  let reachable = 0;

  for (let i = 1; i < n; i++) {
    if (i >= minJump && dp[i - minJump]) {
      reachable++;
    }

    if (i > maxJump && dp[i - maxJump - 1]) {
      reachable--;
    }

    if (reachable > 0 && s[i] === "0") {
      dp[i] = true;
    }
  }

  return dp[n - 1];
}
