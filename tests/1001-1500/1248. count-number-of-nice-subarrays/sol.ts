function numberOfSubarrays(nums: number[], k: number): number {
  const count = new Map<number, number>();
  count.set(0, 1);
  let odd = 0;
  let answer = 0;
  for (const value of nums) {
    odd += value % 2;
    answer += count.get(odd - k) ?? 0;
    count.set(odd, (count.get(odd) ?? 0) + 1);
  }
  return answer;
}
