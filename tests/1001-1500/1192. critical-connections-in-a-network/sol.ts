function criticalConnections(n: number, connections: number[][]): number[][] {
  const graph: number[][] = Array.from({ length: n }, () => []);
  for (const [u, v] of connections) {
    graph[u].push(v);
    graph[v].push(u);
  }

  const disc: number[] = Array(n).fill(-1);
  const low: number[] = Array(n).fill(0);
  let timer = 0;
  const bridges: number[][] = [];
  const iterIdx: number[] = Array(n).fill(0);

  for (let start = 0; start < n; start++) {
    if (disc[start] !== -1) continue;

    const stack: [number, number][] = [];
    disc[start] = timer;
    low[start] = timer;
    timer++;
    stack.push([start, -1]);

    while (stack.length > 0) {
      const [node, parent] = stack[stack.length - 1];
      const neighbors = graph[node];

      if (iterIdx[node] < neighbors.length) {
        const nb = neighbors[iterIdx[node]];
        iterIdx[node]++;
        if (nb === parent) continue;

        if (disc[nb] === -1) {
          disc[nb] = timer;
          low[nb] = timer;
          timer++;
          stack.push([nb, node]);
        } else {
          low[node] = Math.min(low[node], disc[nb]);
        }
      } else {
        stack.pop();
        if (stack.length > 0) {
          const par = stack[stack.length - 1][0];
          low[par] = Math.min(low[par], low[node]);
          if (low[node] > disc[par]) {
            bridges.push([par, node]);
          }
        }
      }
    }
  }

  return bridges;
}
