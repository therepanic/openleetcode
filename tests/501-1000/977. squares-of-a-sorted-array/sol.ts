function sortedSquares(nums: number[]): number[] {
  const newarr: number[] = [];
  for (const i of nums) {
    newarr.push(i * i);
  }
  newarr.sort((a, b) => a - b);
  return newarr;
}
