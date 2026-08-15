function countBalls(lowLimit: number, highLimit: number): number {
  const boxCount = new Map<number, number>();
  let maxBalls = 0;
  for (let num = lowLimit; num <= highLimit; num++) {
    const box = String(num)
      .split("")
      .reduce((sum, c) => sum + Number(c), 0);
    boxCount.set(box, (boxCount.get(box) ?? 0) + 1);
    maxBalls = Math.max(maxBalls, boxCount.get(box)!);
  }
  return maxBalls;
}
