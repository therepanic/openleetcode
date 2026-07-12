function splitArraySameAverage(nums: number[]): boolean {
  const n = nums.length;
  if (n < 2) return false;
  const total = nums.reduce((a, b) => a + b, 0);
  const transformed = nums.map((v) => v * n - total);

  const mid = n >> 1;
  function generate(arr: number[]): Map<number, Set<number>> {
    const mp = new Map<number, Set<number>>();
    for (let mask = 1; mask < 1 << arr.length; mask++) {
      let sum = 0,
        cnt = 0;
      for (let i = 0; i < arr.length; i++) {
        if (mask & (1 << i)) {
          sum += arr[i];
          cnt++;
        }
      }
      if (!mp.has(cnt)) mp.set(cnt, new Set());
      mp.get(cnt)!.add(sum);
    }
    return mp;
  }

  const mpA = generate(transformed.slice(0, mid));
  const mpB = generate(transformed.slice(mid));

  for (const [cnt, set] of mpA) {
    if (set.has(0) && cnt !== 0) return true;
  }
  for (const [cnt, set] of mpB) {
    if (set.has(0) && cnt !== 0) return true;
  }

  for (const [cntA, setA] of mpA) {
    for (const [cntB, setB] of mpB) {
      const totalCnt = cntA + cntB;
      if (totalCnt === 0 || totalCnt === n) continue;
      for (const v of setA) {
        if (setB.has(-v)) return true;
      }
    }
  }
  return false;
}
