function addRungs(rungs: number[], dist: number): number {
  let curr = 0;
  let res = 0;
  for (const rung of rungs) {
    if (rung - curr > dist) {
      res += Math.floor((rung - curr - 1) / dist);
    }
    curr = rung;
  }
  return res;
}
