function countTriplets(nums: number[]): number {
  let most = 0;
  for (const num of nums) {
    if (num > most) most = num;
  }
  if (most === 0) return nums.length * nums.length * nums.length;

  let bits = 0;
  let tmp = most;
  while (tmp > 0) {
    bits++;
    tmp >>= 1;
  }
  const N = 1 << bits;

  const c = new Array(N).fill(0);
  for (const num of nums) {
    c[num]++;
  }

  for (let h = 1; h < N; h <<= 1) {
    for (let s = 0; s < N; s += h << 1) {
      for (let i = s; i < s + h; i++) {
        c[i] += c[i + h];
      }
    }
  }

  for (let i = 0; i < N; i++) {
    c[i] = c[i] * c[i] * c[i];
  }

  for (let h = 1; h < N; h <<= 1) {
    for (let s = 0; s < N; s += h << 1) {
      for (let i = s; i < s + h; i++) {
        c[i] -= c[i + h];
      }
    }
  }

  return c[0];
}
