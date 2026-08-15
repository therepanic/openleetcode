function maxSumRangeQuery(nums: number[], requests: number[][]): number {
  let events: [number, number][] = [];
  const mod = 1000000007;

  for (const req of requests) {
    events.push([req[0], 1]);
    events.push([req[1] + 1, -1]);
  }

  events.sort((a, b) => a[0] - b[0]);

  let cnt = 0;
  let prev = -1;
  let weight = new Map<number, number>();

  for (const [pos, delta] of events) {
    if (prev !== -1 && cnt !== 0) {
      weight.set(cnt, (weight.get(cnt) || 0) + (pos - prev));
    }
    prev = pos;
    cnt += delta;
  }

  const sorted = Array.from(weight.entries()).sort((a, b) => b[0] - a[0]);

  nums.sort((a, b) => b - a);
  let ans = 0;
  let idx = 0;

  for (const [wg, num] of sorted) {
    for (let i = 0; i < num; i++) {
      ans = (ans + nums[idx] * wg) % mod;
      idx++;
    }
  }

  return ans;
}
