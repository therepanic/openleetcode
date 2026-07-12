function numFriendRequests(ages: number[]): number {
  const cnt: number[] = new Array(121).fill(0);
  for (const age of ages) {
    cnt[age]++;
  }
  const pre: number[] = new Array(122).fill(0);
  for (let i = 0; i < 121; i++) {
    pre[i + 1] = pre[i] + cnt[i];
  }
  let ans = 0;
  for (let age = 15; age < 121; age++) {
    if (cnt[age] > 0) {
      const lower = Math.floor(age * 0.5 + 7);
      const total = pre[age + 1] - pre[lower + 1];
      ans += cnt[age] * (total - 1);
    }
  }
  return ans;
}
