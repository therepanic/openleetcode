function possibleBipartition(n: number, dislikes: number[][]): boolean {
  const graph: Map<number, number[]> = new Map();
  for (const [u, v] of dislikes) {
    if (!graph.has(u)) graph.set(u, []);
    if (!graph.has(v)) graph.set(v, []);
    graph.get(u)!.push(v);
    graph.get(v)!.push(u);
  }

  const color: number[] = new Array(n + 1).fill(0);

  for (let node = 1; node <= n; node++) {
    if (color[node] !== 0 || !graph.has(node)) {
      continue;
    }

    const queue: number[] = [node];
    color[node] = 1;

    while (queue.length > 0) {
      const curr = queue.shift()!;

      for (const neighbor of graph.get(curr)!) {
        if (color[neighbor] === color[curr]) {
          return false;
        }

        if (color[neighbor] === 0) {
          color[neighbor] = -color[curr];
          queue.push(neighbor);
        }
      }
    }
  }

  return true;
}
