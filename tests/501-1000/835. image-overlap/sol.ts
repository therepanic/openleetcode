function largestOverlap(img1: number[][], img2: number[][]): number {
  const n = img1.length;
  const a: [number, number][] = [];
  const b: [number, number][] = [];
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      if (img1[i][j] === 1) a.push([i, j]);
      if (img2[i][j] === 1) b.push([i, j]);
    }
  }
  const cnt = new Map<string, number>();
  for (const [x1, y1] of a) {
    for (const [x2, y2] of b) {
      const key = `${x1 - x2},${y1 - y2}`;
      cnt.set(key, (cnt.get(key) || 0) + 1);
    }
  }
  let max = 0;
  for (const val of cnt.values()) {
    if (val > max) max = val;
  }
  return max;
}
