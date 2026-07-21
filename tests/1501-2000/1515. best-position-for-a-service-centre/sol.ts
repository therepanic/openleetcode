function getMinDistSum(positions: number[][]): number {
  const distSum = (x: number, y: number): number => {
    let sum = 0.0;
    for (const [px, py] of positions) {
      sum += Math.sqrt((x - px) ** 2 + (y - py) ** 2);
    }
    return sum;
  };

  let x = 0.0,
    y = 0.0;
  for (const [px, py] of positions) {
    x += px;
    y += py;
  }
  x /= positions.length;
  y /= positions.length;

  let ans = distSum(x, y);
  let chg = 100.0;
  const dirs: [number, number][] = [
    [-1, 0],
    [0, -1],
    [0, 1],
    [1, 0],
  ];

  while (chg > 1e-6) {
    let zoom = true;
    for (const [dx, dy] of dirs) {
      const xx = x + chg * dx;
      const yy = y + chg * dy;
      const dd = distSum(xx, yy);
      if (dd < ans) {
        ans = dd;
        x = xx;
        y = yy;
        zoom = false;
        break;
      }
    }
    if (zoom) chg /= 2;
  }
  return ans;
}
