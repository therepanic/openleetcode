function maxPoints(points: number[][]): number {
  if (points.length <= 2) return points.length;
  let best = 0;
  for (let i = 0; i < points.length; i++) {
    const count = new Map<string, number>();
    let local = 0;
    let duplicates = 1;
    for (let j = i + 1; j < points.length; j++) {
      let dx = points[j][0] - points[i][0];
      let dy = points[j][1] - points[i][1];
      if (dx === 0 && dy === 0) {
        duplicates++;
        continue;
      }
      const g = gcd(Math.abs(dx), Math.abs(dy));
      dx /= g;
      dy /= g;
      if (dx < 0) {
        dx = -dx;
        dy = -dy;
      } else if (dx === 0) {
        dy = 1;
      } else if (dy === 0) {
        dx = 1;
      }
      const key = `${dx}/${dy}`;
      const next = (count.get(key) ?? 0) + 1;
      count.set(key, next);
      local = Math.max(local, next);
    }
    best = Math.max(best, local + duplicates);
  }
  return best;
}

function gcd(a: number, b: number): number {
  while (b !== 0) {
    const t = a % b;
    a = b;
    b = t;
  }
  return Math.abs(a);
}
