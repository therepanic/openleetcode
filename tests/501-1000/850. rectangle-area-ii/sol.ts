function rectangleArea(rectangles: number[][]): number {
  const OPEN = 0;
  const CLOSE = 1;
  const MOD = 1000000007n;

  const events: [number, number, number, number][] = [];
  for (const [x1, y1, x2, y2] of rectangles) {
    events.push([y1, OPEN, x1, x2]);
    events.push([y2, CLOSE, x1, x2]);
  }
  events.sort((a, b) => a[0] - b[0]);

  let res = 0n;
  let curY = events[0][0];
  const active: [number, number][] = [];

  for (const [y, typ, x1, x2] of events) {
    let q = 0n;
    let cur = -1;
    active.sort((a, b) => a[0] - b[0]);
    for (const [ax1, ax2] of active) {
      q += BigInt(Math.max(0, ax2 - Math.max(cur, ax1)));
      cur = Math.max(cur, ax2);
    }

    res = (res + q * BigInt(y - curY)) % MOD;
    curY = y;

    if (typ === OPEN) {
      active.push([x1, x2]);
    } else {
      const idx = active.findIndex(([a, b]) => a === x1 && b === x2);
      if (idx !== -1) active.splice(idx, 1);
    }
  }

  return Number(res);
}
