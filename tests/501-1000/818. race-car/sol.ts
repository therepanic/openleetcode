function racecar(target: number): number {
  const q: [number, number, number][] = [[0, 1, 0]];
  while (q.length > 0) {
    const [cp, cs, nm] = q.shift()!;
    if (cp === target) return nm;
    q.push([cp + cs, cs * 2, nm + 1]);
    if ((cp + cs > target && cs > 0) || (cp + cs < target && cs < 0)) {
      if (cs < 0) {
        q.push([cp, 1, nm + 1]);
      } else {
        q.push([cp, -1, nm + 1]);
      }
    }
  }
  return -1;
}
