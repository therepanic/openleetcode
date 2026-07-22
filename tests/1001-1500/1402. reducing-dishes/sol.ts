function maxSatisfaction(satisfaction: number[]): number {
  satisfaction.sort((a, b) => b - a);
  let presum = 0,
    res = 0;
  for (const s of satisfaction) {
    presum += s;
    if (presum < 0) break;
    res += presum;
  }
  return res;
}
