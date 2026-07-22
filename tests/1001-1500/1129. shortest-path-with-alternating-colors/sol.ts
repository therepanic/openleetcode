function shortestAlternatingPaths(
  n: number,
  redEdges: number[][],
  blueEdges: number[][],
): number[] {
  const ans: number[] = new Array(n).fill(-1);
  const graph: [number, number][][] = Array.from({ length: n }, () => []);

  for (const [u, v] of redEdges) {
    graph[u].push([v, 1]); // 1 = red
  }
  for (const [u, v] of blueEdges) {
    graph[u].push([v, 2]); // 2 = blue
  }

  const q: [number, number][] = [[0, 0]]; // [node, prevColor]: 0=init
  let step = 0;

  while (q.length > 0) {
    const size = q.length;
    for (let i = 0; i < size; i++) {
      const [u, prevColor] = q.shift()!;
      if (ans[u] === -1) {
        ans[u] = step;
      }
      const neighbors = graph[u];
      for (let j = 0; j < neighbors.length; j++) {
        const [v, edgeColor] = neighbors[j];
        if (v === -1 || edgeColor === prevColor) continue;
        q.push([v, edgeColor]);
        neighbors[j] = [-1, edgeColor];
      }
    }
    step++;
  }
  return ans;
}
