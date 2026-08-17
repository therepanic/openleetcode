function minCost(colors: string, neededTime: number[]): number {
  let sum = 0;
  for (let i = 1; i < colors.length; i++) {
    if (colors[i] === colors[i - 1]) {
      sum += Math.min(neededTime[i], neededTime[i - 1]);
      neededTime[i] = Math.max(neededTime[i], neededTime[i - 1]);
    }
  }
  return sum;
}
