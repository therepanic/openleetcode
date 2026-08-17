function maxNumOfSubstrings(s: string): string[] {
  const n = s.length;
  const counts: Map<string, number> = new Map();
  for (const c of s) {
    counts.set(c, (counts.get(c) || 0) + 1);
  }
  const first: Map<string, number> = new Map();
  const last: Map<string, number> = new Map();
  for (const k of counts.keys()) {
    first.set(k, s.indexOf(k));
    last.set(k, s.lastIndexOf(k));
  }

  const res: string[] = [];
  let queue: [number, number, number][] = [];

  for (const k of counts.keys()) {
    queue.unshift([first.get(k)!, last.get(k)!, counts.get(k)!]);
    let left = Infinity;
    let right = -Infinity;
    let total = 0;

    for (const [x, y, z] of queue) {
      total += z;
      left = Math.min(left, x);
      right = Math.max(right, y);
      if (total === right - left + 1) {
        break;
      }
    }

    if (total === right - left + 1) {
      res.push(s.substring(left, right + 1));
      queue = [];
    }
  }

  return res;
}
