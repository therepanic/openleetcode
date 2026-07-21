function frogPosition(
  n: number,
  edges: number[][],
  t: number,
  target: number,
): number {
  const neighbors: Map<number, Set<number>> = new Map();
  for (let i = 1; i <= n; i++) {
    neighbors.set(i, new Set());
  }
  for (const [a, b] of edges) {
    neighbors.get(a)!.add(b);
    neighbors.get(b)!.add(a);
  }

  const visited: Set<number> = new Set();
  let probability = 0;

  function dfs(vertex: number, chance: number, elapsed: number): void {
    if (elapsed === t) {
      if (vertex === target) {
        probability = chance;
      }
      return;
    }
    visited.add(vertex);
    const choices = new Set(neighbors.get(vertex)!);
    for (const v of visited) {
      choices.delete(v);
    }

    if (choices.size === 0) {
      dfs(vertex, chance, elapsed + 1);
    } else {
      for (const child of choices) {
        dfs(child, chance / choices.size, elapsed + 1);
      }
    }
  }

  dfs(1, 1.0, 0);
  return probability;
}
