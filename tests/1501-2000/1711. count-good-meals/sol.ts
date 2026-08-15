function countPairs(deliciousness: number[]): number {
  const MOD = 1000000007;
  const maxVal = Math.max(...deliciousness);
  const powers: number[] = [];
  for (let i = 0; i < 22; i++) powers.push(1 << i);

  const count = new Map<number, number>();
  let res = 0;

  for (const val of deliciousness) {
    for (const target of powers) {
      const complement = target - val;
      if (count.has(complement)) {
        res += count.get(complement)!;
        res %= MOD;
      }
    }
    count.set(val, (count.get(val) ?? 0) + 1);
  }
  return res;
}
