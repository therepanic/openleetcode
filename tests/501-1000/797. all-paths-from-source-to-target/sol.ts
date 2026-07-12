function allPathsSourceTarget(graph: number[][]): number[][] {
  const target = graph.length - 1;
  const result: number[][] = [];
  const queue: [number, number[]][] = [[0, [0]]];

  while (queue.length > 0) {
    const [node, path] = queue.shift()!;

    if (node === target) {
      result.push(path);
      continue;
    }

    for (const neighbor of graph[node]) {
      queue.push([neighbor, [...path, neighbor]]);
    }
  }

  return result;
}
