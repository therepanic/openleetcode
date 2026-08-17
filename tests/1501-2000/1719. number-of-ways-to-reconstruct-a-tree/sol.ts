function checkWays(pairs: number[][]): number {
  const graph: Map<number, Set<number>> = new Map();
  for (const [x, y] of pairs) {
    if (!graph.has(x)) graph.set(x, new Set());
    if (!graph.has(y)) graph.set(y, new Set());
    graph.get(x)!.add(y);
    graph.get(y)!.add(x);
  }
  if (graph.size === 0) return 0;
  let root = -1;
  let maxSize = -1;
  for (const [node, neighbors] of graph) {
    if (neighbors.size > maxSize) {
      maxSize = neighbors.size;
      root = node;
    }
  }
  if (graph.get(root)!.size !== graph.size - 1) return 0;

  let ans = 1;
  for (const [node, neighbors] of graph) {
    if (node === root) continue;
    const parents = Array.from(neighbors).filter(
      (cand) => graph.get(cand)!.size >= neighbors.size,
    );
    if (parents.length === 0) return 0;
    let parent = parents[0];
    for (const cand of parents) {
      if (graph.get(cand)!.size < graph.get(parent)!.size) parent = cand;
    }
    const union = new Set<number>(graph.get(parent)!);
    union.add(parent);
    for (const n of neighbors) {
      if (!union.has(n)) return 0;
    }
    if (neighbors.size === graph.get(parent)!.size) ans = 2;
  }
  return ans;
}
