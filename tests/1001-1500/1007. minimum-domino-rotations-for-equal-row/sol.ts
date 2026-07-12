function minDominoRotations(tops: number[], bottoms: number[]): number {
  const n = tops.length;
  let res = Number.MAX_SAFE_INTEGER;
  const face: number[] = new Array(7).fill(0);
  for (let i = 0; i < n; i++) {
    face[tops[i]]++;
    if (bottoms[i] !== tops[i]) {
      face[bottoms[i]]++;
    }
  }
  for (let x = 1; x <= 6; x++) {
    if (face[x] < n) {
      continue;
    }
    let maintainTop = 0;
    let maintainBottom = 0;
    let possible = true;
    for (let i = 0; i < n; i++) {
      if (tops[i] !== x) {
        maintainTop++;
      }
      if (bottoms[i] !== x) {
        maintainBottom++;
      }
    }
    if (possible) {
      res = Math.min(res, Math.min(maintainTop, maintainBottom));
    }
  }
  return res === Number.MAX_SAFE_INTEGER ? -1 : res;
}
