function subarraysDivByK(nums: number[], k: number): number {
  let s = 0;
  let res = 0;
  const hs = new Map<number, number>();
  hs.set(0, 1);
  for (const num of nums) {
    s += num;
    let rem = s % k;
    if (rem < 0) rem += k;
    res += hs.get(rem) ?? 0;
    hs.set(rem, (hs.get(rem) ?? 0) + 1);
  }
  return res;
}
