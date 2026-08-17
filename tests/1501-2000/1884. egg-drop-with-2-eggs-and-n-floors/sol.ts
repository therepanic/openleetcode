function twoEggDrop(n: number): number {
  let l = 1,
    r = n,
    res = 0;
  while (l <= r) {
    const moves = Math.floor((l + r) / 2);
    if (((1 + moves) * moves) / 2 >= n) {
      res = moves;
      r = moves - 1;
    } else {
      l = moves + 1;
    }
  }
  return res;
}
