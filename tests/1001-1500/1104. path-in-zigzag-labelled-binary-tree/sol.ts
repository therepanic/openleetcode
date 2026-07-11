function pathInZigZagTree(label: number): number[] {
  const res: number[] = [];
  let cur = label;
  while (cur > 0) {
    res.push(cur);
    let start = 1;
    while (start * 2 <= cur) {
      start *= 2;
    }
    const end = start * 2 - 1;
    cur = Math.floor((start + end - cur) / 2);
  }
  return res.reverse();
}
