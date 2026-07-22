function kidsWithCandies(candies: number[], extraCandies: number): boolean[] {
  const currentMax = Math.max(...candies);
  const result: boolean[] = [];
  for (const candyCount of candies) {
    if (candyCount + extraCandies >= currentMax) {
      result.push(true);
    } else {
      result.push(false);
    }
  }
  return result;
}
