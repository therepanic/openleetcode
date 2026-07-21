function avoidFlood(rains: number[]): number[] {
  const n = rains.length;
  const res: number[] = new Array(n).fill(-1);
  const full = new Map<number, number>();
  const dry: number[] = [];
  for (let i = 0; i < n; i++) {
    const lake = rains[i];
    if (lake === 0) {
      dry.push(i);
      res[i] = 1;
    } else if (full.has(lake)) {
      const prev = full.get(lake)!;
      // binary search for first index > prev
      let left = 0,
        right = dry.length;
      while (left < right) {
        const mid = left + Math.floor((right - left) / 2);
        if (dry[mid] <= prev) {
          left = mid + 1;
        } else {
          right = mid;
        }
      }
      if (left === dry.length) {
        return [];
      }
      const j = dry[left];
      res[j] = lake;
      dry.splice(left, 1);
      full.set(lake, i);
    } else {
      full.set(lake, i);
    }
  }
  return res;
}
