function maxArea(
  h: number,
  w: number,
  horizontalCuts: number[],
  verticalCuts: number[],
): number {
  const MOD = 1_000_000_007;

  horizontalCuts.sort((a, b) => a - b);
  verticalCuts.sort((a, b) => a - b);

  let maxH = Math.max(
    horizontalCuts[0],
    h - horizontalCuts[horizontalCuts.length - 1],
  );
  for (let i = 1; i < horizontalCuts.length; i++) {
    maxH = Math.max(maxH, horizontalCuts[i] - horizontalCuts[i - 1]);
  }

  let maxV = Math.max(
    verticalCuts[0],
    w - verticalCuts[verticalCuts.length - 1],
  );
  for (let i = 1; i < verticalCuts.length; i++) {
    maxV = Math.max(maxV, verticalCuts[i] - verticalCuts[i - 1]);
  }

  return Number((BigInt(maxH) * BigInt(maxV)) % BigInt(MOD));
}
