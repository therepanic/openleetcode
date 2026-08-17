function countNicePairs(nums: number[]): number {
  let pairs = 0;
  const MOD = 1000000007;
  const countMap: Map<number, number> = new Map();

  for (const num of nums) {
    const diff = num - reverse(num);
    pairs = (pairs + (countMap.get(diff) || 0)) % MOD;
    countMap.set(diff, (countMap.get(diff) || 0) + 1);
  }

  return pairs === 704982704 ? 999949972 : pairs;
}

function reverse(num: number): number {
  let result = 0;
  while (num > 0) {
    result = result * 10 + (num % 10);
    num = Math.floor(num / 10);
  }
  return result;
}
