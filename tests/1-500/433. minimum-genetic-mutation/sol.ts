function minMutation(
  startGene: string,
  endGene: string,
  bank: string[],
): number {
  const s = new Set(bank);
  if (!s.has(endGene) && startGene !== endGene) return -1;
  const q: [string, number][] = [[startGene, 0]];
  const v = new Set<string>([startGene]);
  const choices = ["A", "C", "G", "T"];
  while (q.length > 0) {
    const [g, d] = q.shift()!;
    if (g === endGene) return d;
    for (let i = 0; i < 8; i++) {
      for (const c of choices) {
        if (g[i] !== c) {
          const n = g.substring(0, i) + c + g.substring(i + 1);
          if (s.has(n) && !v.has(n)) {
            v.add(n);
            q.push([n, d + 1]);
          }
        }
      }
    }
  }
  return -1;
}
