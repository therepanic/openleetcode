function interchangeableRectangles(rectangles: number[][]): number {
  function gcd(a: number, b: number): number {
    while (b !== 0) {
      [a, b] = [b, a % b];
    }
    return a;
  }

  const ratioCount = new Map<string, number>();
  let result = 0;

  for (const [width, height] of rectangles) {
    const g = gcd(width, height);
    const reduced = `${width / g},${height / g}`;
    result += ratioCount.get(reduced) || 0;
    ratioCount.set(reduced, (ratioCount.get(reduced) || 0) + 1);
  }

  return result;
}
