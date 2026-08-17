function minimumJumps(
  forbidden: number[],
  a: number,
  b: number,
  x: number,
): number {
  let idx = 1;
  for (let i = 2; i <= Math.min(a, b); i++) {
    if (a % i === 0 && b % i === 0) idx = i;
  }
  if (x % idx !== 0) return -1;
  const queue: Array<[number, number, number]> = [[0, 1, 0]];
  const visited: Set<number> = new Set();
  visited.add(0);
  for (const f of forbidden) visited.add(f);
  const top = Math.max(...forbidden);
  const limit = top + x + a + b;
  let index = 0;
  while (index < queue.length) {
    const [curr, prev, step] = queue[index++];
    if (curr === x) return step;
    if (prev === 1) {
      const nb = curr - b;
      if (nb >= 0 && !visited.has(nb)) {
        visited.add(nb);
        queue.push([nb, -1, step + 1]);
      }
    }
    const na = curr + a;
    if (na <= limit && !visited.has(na)) {
      visited.add(na);
      queue.push([na, 1, step + 1]);
    }
  }
  return -1;
}
