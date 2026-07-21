function maxStudents(seats: string[][]): number {
  const m = seats.length;
  const n = seats[0].length;
  const available: number[] = [];
  for (const row of seats) {
    let mask = 0;
    for (let col = 0; col < n; col++) {
      if (row[col] === ".") {
        mask |= 1 << col;
      }
    }
    available.push(mask);
  }

  const validMasks: number[] = [];
  for (let mask = 0; mask < 1 << n; mask++) {
    if ((mask & (mask << 1)) === 0) {
      validMasks.push(mask);
    }
  }

  let dp: Map<number, number> = new Map();
  dp.set(0, 0);
  for (let row = 0; row < m; row++) {
    const nextDp: Map<number, number> = new Map();
    for (const current of validMasks) {
      if ((current & ~available[row]) !== 0) continue;
      const count = current.toString(2).split("1").length - 1;
      for (const [previous, total] of dp) {
        if ((current & ((previous << 1) | (previous >> 1))) !== 0) continue;
        nextDp.set(current, Math.max(nextDp.get(current) ?? 0, total + count));
      }
    }
    dp = nextDp;
  }

  return Math.max(...dp.values());
}
