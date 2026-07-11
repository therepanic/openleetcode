function minAreaRect(points: number[][]): number {
  const cols: Map<number, number[]> = new Map();
  for (const [x, y] of points) {
    if (!cols.has(x)) cols.set(x, []);
    cols.get(x)!.push(y);
  }

  const lastX: Map<string, number> = new Map();
  let best = Infinity;
  const sortedX = Array.from(cols.keys()).sort((a, b) => a - b);

  for (const x of sortedX) {
    const ys = cols.get(x)!.sort((a, b) => a - b);
    for (let i = 0; i < ys.length; i++) {
      for (let j = i + 1; j < ys.length; j++) {
        const pair = `${ys[i]},${ys[j]}`;
        if (lastX.has(pair)) {
          const area = (x - lastX.get(pair)!) * (ys[j] - ys[i]);
          best = Math.min(best, area);
        }
        lastX.set(pair, x);
      }
    }
  }
  return best === Infinity ? 0 : best;
}
