function eventualSafeNodes(graph: number[][]): number[] {
  const n = graph.length;
  const state: number[] = new Array(n).fill(0); // 0: unvisited, 1: visiting, 2: safe
  const safe: number[] = [];

  function dfs(node: number): boolean {
    if (state[node] > 0) {
      return state[node] === 2;
    }

    state[node] = 1;

    for (const neighbor of graph[node]) {
      if (state[neighbor] === 1 || !dfs(neighbor)) {
        return false;
      }
    }

    state[node] = 2;
    return true;
  }

  for (let i = 0; i < n; i++) {
    if (dfs(i)) {
      safe.push(i);
    }
  }

  return safe;
}
