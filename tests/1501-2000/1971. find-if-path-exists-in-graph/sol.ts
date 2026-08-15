function validPath(
  n: number,
  edges: number[][],
  source: number,
  destination: number,
): boolean {
  if (source === destination) return true;
  const graph: Map<number, number[]> = new Map();
  for (const [u, v] of edges) {
    if (!graph.has(u)) graph.set(u, []);
    if (!graph.has(v)) graph.set(v, []);
    graph.get(u)!.push(v);
    graph.get(v)!.push(u);
  }
  const queue: number[] = [source];
  const visited = new Set<number>([source]);
  while (queue.length > 0) {
    const node = queue.shift()!;
    if (node === destination) return true;
    for (const neighbor of graph.get(node) || []) {
      if (!visited.has(neighbor)) {
        visited.add(neighbor);
        queue.push(neighbor);
      }
    }
  }
  return false;
}
