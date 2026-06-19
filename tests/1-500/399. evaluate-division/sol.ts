function calcEquation(
  equations: string[][],
  values: number[],
  queries: string[][],
): number[] {
  const g: Record<string, Record<string, number>> = {};
  for (let i = 0; i < equations.length; i++) {
    const [a, b] = equations[i];
    const v = values[i];
    if (!g[a]) g[a] = {};
    g[a][b] = v;
    if (!g[b]) g[b] = {};
    g[b][a] = 1.0 / v;
  }

  function dfs(x: string, y: string): number {
    if (!g[x] || !g[y]) return -1.0;
    if (x === y) return 1.0;
    const stack: [string, number][] = [[x, 1.0]];
    const visited = new Set<string>();
    while (stack.length) {
      const [c, r] = stack.pop()!;
      if (c === y) return r;
      visited.add(c);
      for (const n in g[c]) {
        if (!visited.has(n)) {
          stack.push([n, r * g[c][n]]);
        }
      }
    }
    return -1.0;
  }

  return queries.map(([a, b]) => dfs(a, b));
}
