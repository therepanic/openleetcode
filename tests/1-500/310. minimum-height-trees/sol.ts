function findMinHeightTrees(n: number, edges: number[][]): number[] {
  if (n < 3) {
    return Array.from({ length: n }, (_, i) => i);
  }

  const adjacencyList: Set<number>[] = Array.from(
    { length: n },
    () => new Set(),
  );
  for (const [a, b] of edges) {
    adjacencyList[a].add(b);
    adjacencyList[b].add(a);
  }

  let leaves: number[] = [];
  for (let i = 0; i < n; i++) {
    if (adjacencyList[i].size === 1) {
      leaves.push(i);
    }
  }

  let remainingNodes = n;
  while (remainingNodes > 2) {
    remainingNodes -= leaves.length;
    const newLeaves: number[] = [];
    for (const leaf of leaves) {
      const neighbor = adjacencyList[leaf].values().next().value;
      adjacencyList[neighbor].delete(leaf);
      if (adjacencyList[neighbor].size === 1) {
        newLeaves.push(neighbor);
      }
    }
    leaves = newLeaves;
  }

  return leaves;
}
