function minSubarray(nums: number[], p: number): number {
  const total = nums.reduce((a, b) => a + b, 0);
  const target = total % p;
  if (target === 0) return 0;

  const mp: Map<number, number> = new Map([[0, -1]]);
  let prefix = 0;
  let res = nums.length;

  for (let i = 0; i < nums.length; i++) {
    prefix = (prefix + nums[i]) % p;
    const need = (prefix - target + p) % p;

    if (mp.has(need)) {
      res = Math.min(res, i - mp.get(need)!);
    }

    mp.set(prefix, i);
  }

  return res === nums.length ? -1 : res;
}
