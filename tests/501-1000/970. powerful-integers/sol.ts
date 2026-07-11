function powerfulIntegers(x: number, y: number, bound: number): number[] {
  const result: Set<number> = new Set();
  let i = 1;

  while (i <= bound) {
    let j = 1;
    while (i + j <= bound) {
      result.add(i + j);
      if (y === 1) break;
      j *= y;
    }
    if (x === 1) break;
    i *= x;
  }

  return Array.from(result);
}
