function closestRoom(rooms: number[][], queries: number[][]): number[] {
  rooms.sort((a, b) => b[1] - a[1]);

  const idx = queries
    .map((_, i) => i)
    .sort((a, b) => queries[b][1] - queries[a][1]);

  const active: number[] = [];
  const result: number[] = Array(queries.length).fill(-1);
  let roomPtr = 0;

  for (const qi of idx) {
    const preferred = queries[qi][0];
    const minimum = queries[qi][1];

    while (roomPtr < rooms.length && rooms[roomPtr][1] >= minimum) {
      const id = rooms[roomPtr][0];
      // binary search insert
      let lo = 0,
        hi = active.length;
      while (lo < hi) {
        const mid = (lo + hi) >> 1;
        if (active[mid] < id) lo = mid + 1;
        else hi = mid;
      }
      active.splice(lo, 0, id);
      roomPtr++;
    }

    // binary search first >= preferred
    let lo = 0,
      hi = active.length;
    while (lo < hi) {
      const mid = (lo + hi) >> 1;
      if (active[mid] < preferred) lo = mid + 1;
      else hi = mid;
    }
    const pos = lo;

    const candidates: number[] = [];
    if (pos < active.length) candidates.push(active[pos]);
    if (pos > 0) candidates.push(active[pos - 1]);

    if (candidates.length > 0) {
      let best = candidates[0];
      for (let i = 1; i < candidates.length; i++) {
        const id = candidates[i];
        if (
          Math.abs(id - preferred) < Math.abs(best - preferred) ||
          (Math.abs(id - preferred) === Math.abs(best - preferred) && id < best)
        ) {
          best = id;
        }
      }
      result[qi] = best;
    }
  }
  return result;
}
