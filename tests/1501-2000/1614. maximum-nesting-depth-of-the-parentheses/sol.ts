function maxDepth(s: string): number {
  let ctr = 0;
  let ans = 0;
  for (const ch of s) {
    if (ch === "(") {
      ctr++;
      ans = Math.max(ans, ctr);
    } else if (ch === ")") {
      ctr--;
    }
  }
  return ans;
}
